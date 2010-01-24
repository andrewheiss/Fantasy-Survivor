# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  before_filter :maintain_session_and_user
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def require_login
    unless @current_user
      flash[:notice] = "Please login to continue"
      redirect_to(login_path)
    end
  end
 
  def require_logout
    if @current_user
      flash[:notice] = "You must logout before you can login or register"
      redirect_to(root_url)
    end
  end
  
  def require_admin
    unless @current_user.level == 'admin'
      flash[:notice] = "You must be an administrator to do that."
      redirect_to(root_url)
    end
  end
  
  private
  
  def admin?
    if @current_user && @current_user.level == 'admin'
      return true
    end
  end
  
  helper_method :admin?
 
  def maintain_session_and_user
    if session[:id]
      if @application_session = Session.find_by_id(session[:id])
        @application_session.update_attributes(:ip_address => request.remote_addr, :path => request.path_info)
        @current_user = @application_session.user
      else
        session[:id] = nil
        redirect_to(root_url)
      end
    end
  end

  def find_show
    @show = Show.find(params[:id])
  end
  
  def find_show_nested
    @show = Show.find(params[:show_id])
  end
  
  def find_contestant
    @contestant = Contestant.find(params[:id])
  end
  
  def find_episode
    @episode = Episode.find(params[:id])
  end
  
end
