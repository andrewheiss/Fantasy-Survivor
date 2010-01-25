class Vote < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :episode
  belongs_to :user
  validates_presence_of :contestant_id, :episode_id
  
  validates_uniqueness_of :user_id, :scope => :episode_id
end
