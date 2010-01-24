require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have a votes association" do
    assert_equal 2, users(:sally).votes.size
    assert_equal votes(:one), users(:sally).votes.last
  end
  
  test "should not be valid without password" do
    u = User.create(:login => 'test', :name => 'Test', :email => 'test@test.com')
    assert ! u.valid?
  end
  
  test "should create salt" do
    u = User.create(:login => 'test', :name => 'Test', :email => 'test@test.com', :password => 'testpassword')
    assert_not_nil u.salt
  end
  
  test "find by login and password" do
    u = User.find_by_login_and_password(users(:sally).login, 'test')
    assert_equal u.login, users(:sally).login
  end
  
end
