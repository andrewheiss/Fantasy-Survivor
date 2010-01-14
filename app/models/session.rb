class Session < ActiveRecord::Base
  attr_accessor :name, :password, :match
 
  belongs_to :user
 
  before_validation :authenticate_user
 
  validates_presence_of :match, :message => 'for your name and password could not be found', :unless => :session_has_been_associated?
 
  before_save :associate_session_to_user
 
  private
 
  def authenticate_user
    self.match = User.find_by_name_and_password(self.name, self.password) unless session_has_been_associated?
  end
 
  def associate_session_to_user
    self.user_id ||= self.match.id
  end
 
  def session_has_been_associated?
    self.user_id
  end
end
