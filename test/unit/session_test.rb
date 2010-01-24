require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "should authenticate user" do
    s = Session.create(:login => users(:sally).login, :password => 'test')
    assert s.valid?
  end
  
  test "should not authenticate unregistered user" do
    s = Session.create(:login => 'bogus', :password => 'blah')
    assert ! s.valid?
  end
end
