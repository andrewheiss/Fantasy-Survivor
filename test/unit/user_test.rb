require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have a votes association" do
    assert_equal 2, users(:sally).votes.size
    assert_equal votes(:one), users(:sally).votes.last
  end
  
end
