class Vote < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :episode
  belongs_to :user
  validates_presence_of :contestant_id, :episode_id
end
