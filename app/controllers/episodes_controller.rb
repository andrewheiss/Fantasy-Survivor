class EpisodesController < ApplicationController
  before_filter :require_login
  before_filter :require_admin, :except => [:index, :show]
  before_filter :find_show_nested, :only => [:create, :new]
  before_filter :find_episode, :only => [:show, :edit, :update, :destroy]
  
  def index
    @episodes = Episode.find(:all, :order => 'name ASC')
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
      redirect_to episode_path(@episode)
    else
      render :action => 'edit'
    end
  end

  def destroy
    show = @episode.show
    @episode.destroy
    redirect_to show_path(show)
  end

end
