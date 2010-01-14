class SessionsController < ApplicationController
  before_filter :require_login, :only => :destroy
  before_filter :require_logout, :only => [:new, :create]
 
  def index
    redirect_to(login_path)
  end
 
  def new
    @session = Session.new
  end
 
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      flash[:notice] = "Hello #{@session.user.name}, you are now logged in"
      redirect_to(root_url)
    else
      render(:action => 'new')
    end
  end
 
  def destroy
    Session.destroy(@application_session)
    session[:id] = @current_user = nil
    flash[:notice] = "You are now logged out"
    redirect_to(root_url)
  end
end
