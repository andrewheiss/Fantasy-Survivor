class ContestantsController < ApplicationController
  before_filter :find_show_nested
  before_filter :find_contestant, :only => [:show, :edit, :update, :destroy]
  
  def index
    @contestants = @show.contestants
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
      redirect_to show_contestant_path(@show, @contestant)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contestant.destroy
    redirect_to show_path(@show)
  end

end
