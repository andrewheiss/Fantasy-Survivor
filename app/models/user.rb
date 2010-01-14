require 'digest/sha2'

class User < ActiveRecord::Base
  attr_reader :password
 
  ENCRYPT = Digest::SHA256
 
  has_many :sessions, :dependent => :destroy
  has_many :votes
  
  validates_presence_of :name, :login, :email
  
  validates_uniqueness_of :login, :message => "is already in use by another user"
  
  validates_format_of :login, :with => /^([a-z0-9_]{2,16})$/i,
                      :message => "must be 4 to 16 letters, numbers or underscores and have no spaces"
   
  validates_format_of :password, :with => /^([\x20-\x7E]){4,16}$/,
                      :message => "must be 4 to 16 characters",
                      :unless => :password_is_not_being_updated?
 
  validates_confirmation_of :password
  
  validates_uniqueness_of :email, :message => "is already in use"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "is invalid"
   
  before_save :scrub_login
  after_save :flush_passwords
 
  def self.find_by_login_and_password(login, password)
    user = self.find_by_login(login)
    if user and user.encrypted_password == ENCRYPT.hexdigest(password + user.salt)
      return user
    end
  end
 
  def password=(password)
    @password = password
    unless password_is_not_being_updated?
      self.salt = [Array.new(9){rand(256).chr}.join].pack('m').chomp
      self.encrypted_password = ENCRYPT.hexdigest(password + self.salt)
    end
  end
 
  private
 
  def scrub_login
    self.login.downcase!
  end
 
  def flush_passwords
    @password = @password_confirmation = nil
  end
 
  def password_is_not_being_updated?
    self.id and self.password.blank?
  end
end
