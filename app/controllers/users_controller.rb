class UsersController < ApplicationController
  before_filter :ensure_login, :only => [:edit, :update, :destroy]
  before_filter :ensure_logout, :only => [:new, :create]
 
  def index
    @users = User.find(:all)
  end
 
  def show
    @user = User.find(params[:id])
  end
 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(params[:person])
    if @user.save
      @session = @user.sessions.create
      session[:id] = @session.id
      flash[:notice] = "Welcome #{@user.name}, you are now registered"
      redirect_to(root_url)
    else
      render(:action => 'new')
    end
  end
 
  def edit
    @user = User.find(@current_user)
  end
 
  def update
    @user = User.find(@current_user)
    if @user.update_attributes(params[:person])
      flash[:notice] = "Your account has been updated"
      redirect_to(root_url)
    else
      render(:action => 'edit')
    end
  end
 
  def destroy
    User.destroy(@current_user)
    session[:id] = @current_user = nil
    flash[:notice] = "You are now unregistered"
    redirect_to(root_url)
  end
end
