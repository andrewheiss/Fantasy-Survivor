class EpisodesController < ApplicationController
  before_filter :find_show_nested
  before_filter :find_episode, :only => [:show, :edit, :update, :destroy]
  
  def index
    @episodes = @show.episodes
  end
  
  def show
  end

  def new
    @episode = @show.episodes.build
  end

  def create
    @episode = @show.episodes.build(params[:episode])
    if @episode.save
      flash[:notice] = 'Episode saved'
      redirect_to show_path(@show)
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @episode.update_attributes(params[:episode])
      flash[:notice] = 'Episode updated'
      redirect_to show_episode_path(@show, @episode)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @episode.destroy
    redirect_to show_path(@show)
  end

end
