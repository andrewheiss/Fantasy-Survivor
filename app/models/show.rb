class Show < ActiveRecord::Base
  has_many :contestants, :dependent => :destroy
  validates_presence_of :name
end
