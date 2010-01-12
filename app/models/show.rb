class Show < ActiveRecord::Base
  has_many :contestants, :dependent => :destroy
  has_many :episodes, :dependent => :destroy
  validates_presence_of :name
end
