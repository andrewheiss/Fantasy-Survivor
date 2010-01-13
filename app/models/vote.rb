class Vote < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :episode
  validates_presence_of :contestant_id, :episode_id
end
