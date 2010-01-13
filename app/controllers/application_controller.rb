# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :fetch_logged_in_user
  
protected

  def fetch_logged_in_user
    return unless session[:user_id]
    @current_user = User.find_by_id(session[:user_id])
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
