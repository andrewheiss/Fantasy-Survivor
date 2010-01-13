require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "check contestant association" do
    assert_equal contestants(:jim), votes(:one).contestant
  end
end
