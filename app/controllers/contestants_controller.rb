class ContestantsController < ApplicationController
  def index
    @contestant = Contestant.find(:first, :order => 'RANDOM()')
  end
  
  def new
    @contestant = Contestant.new
  end
  
  def create
    @contestant = Contestant.new(params[:contestant])
    if @contestant.save
      flash[:notice] = 'Contestant saved'
      redirect_to contestants_path
    else
      render :action => 'new'
    end
  end

end
