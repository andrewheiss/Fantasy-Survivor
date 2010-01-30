class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update, :destroy]
  before_filter :require_logout, :only => [:new, :create, :recover, :help]
  before_filter :require_admin, :only => [:index]
 
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
    @user = User.new(params[:user])
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
    if @user.update_attributes(params[:user])
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
  
  def recover
    user = User.find_by_login(params[:login])
    if user
      Mailer.deliver_recovery( :key => Crypto.encrypt("#{user.id}:#{user.salt}"),
                              :email => user.email,
                              :domain => request.env['HTTP_HOST'])
      flash[:notice] = "Please check your e-mail"
      redirect_to(root_url)
    else
      flash[:notice] = "Your account could not be found"
      redirect_to(help_users_path)
    end
  end
end
