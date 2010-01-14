require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "check contestant association" do
    assert_equal contestants(:jim), votes(:one).contestant
  end
  
  test "should be associated with user" do
    assert_equal users(:sally), votes(:one).user
  end
end
