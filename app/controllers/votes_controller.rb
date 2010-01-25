class VotesController < ApplicationController
  before_filter :require_login
  def create
    @vote = Vote.create(
      :user_id => @current_user.id, 
      :contestant_id => params[:contestant_id], 
      :episode_id=> params[:episode_id])
    @contestant = Contestant.find(params[:contestant_id])
    @episode = Episode.find(params[:episode_id])
    
    respond_to do |format|
      format.html {redirect_to @vote.episode}
      format.js
    end
  end

end
