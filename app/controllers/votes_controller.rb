class VotesController < ApplicationController
  before_filter :login_required
  def create
    @vote = Vote.create(
      :user_id => session[:user_id], 
      :contestant_id => params[:contestant_id], 
      :episode_id=> params[:episode_id])
    @contestant = Contestant.find(params[:contestant_id])
    
    respond_to do |format|
      format.html {redirect_to @vote.episode}
      format.js
    end
  end

end
