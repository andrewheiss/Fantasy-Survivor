class VotesController < ApplicationController
  def create
    @vote = Vote.create(:contestant_id => params[:contestant_id], :episode_id=> params[:episode_id])
    @contestant = Contestant.find(params[:contestant_id])
    
    respond_to do |format|
      format.html {redirect_to @vote.episode}
      format.js
    end
  end

end
