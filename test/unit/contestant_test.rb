require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  test "check show association" do
    assert_equal shows(:one), contestants(:jim).show
  end
  
  test "should be associated with votes" do
    assert_equal [ votes(:two), votes(:one) ], contestants(:jim).votes
  end
end
