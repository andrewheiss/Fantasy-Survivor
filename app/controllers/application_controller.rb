# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
protected

  def find_show
    @show = Show.find(params[:id])
  end

  def find_show_nested
    @show = Show.find(params[:show_id])
  end

  def find_contestant
    @contestant = @show.contestants.find(params[:id])
  end
  
  def find_episode
    @episode = @show.episodes.find(params[:id])
  end
  
end
