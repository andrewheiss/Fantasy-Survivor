class ShowsController < ApplicationController
  before_filter :login_required
  before_filter :find_show, :only => [:show, :edit, :update, :destroy]
  
  def index
    @shows = Show.find(:all, :order => 'name ASC')
  end

  def show
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(params[:show])
    if @show.save
      flash[:notice] = 'Show saved'
      redirect_to show_path(@show)
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @show.update_attributes(params[:show])
      flash[:notice] = 'Show updated'
      redirect_to show_path(@show)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @show.destroy
    redirect_to root_path(@show)
  end

end
