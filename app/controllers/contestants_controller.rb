class ContestantsController < ApplicationController
  before_filter :login_required
  before_filter :find_show_nested, :only => [:create, :new]
  before_filter :find_contestant, :only => [:show, :edit, :update, :destroy]
  
  def index
    @contestants = Contestant.find(:all, :order => 'name ASC')
  end
  
  def show
  end
  
  def new
    @contestant = @show.contestants.build
  end
  
  def create
    @contestant = @show.contestants.build(params[:contestant])
    if @contestant.save
      flash[:notice] = 'Contestant saved'
      redirect_to show_path(@show)
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @contestant.update_attributes(params[:contestant])
      flash[:notice] = 'Contestant updated'
      redirect_to contestant_path(@contestant)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    show = @contestant.show
    @contestant.destroy
    redirect_to show_path(show)
  end

end
