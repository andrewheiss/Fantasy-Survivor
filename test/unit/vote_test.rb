require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "check contestant association" do
    assert_equal contestants(:jim), votes(:one).contestant
  end
  
  test "should be associated with user" do
    assert_equal users(:sally), votes(:one).user
  end
  
  test "user should only be able to vote once per episode" do
    # Sally has already voted this week
    v = Vote.create(:contestant => contestants(:jim), :episode => episodes(:week_one), :user => users(:sally))
    assert ! v.valid?
  end
  
  test "user should be able to vote if they haven't voted yet" do
    # John hasn't voted for anything yet
    v = Vote.create(:contestant => contestants(:jim), :episode => episodes(:week_one), :user => users(:john))
    assert v.valid?
  end
end
