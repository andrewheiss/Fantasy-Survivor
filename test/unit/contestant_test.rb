require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  test "check show association" do
    assert_equal shows(:one), contestants(:jim).show
  end
end
