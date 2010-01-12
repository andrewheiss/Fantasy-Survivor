require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  test "check show association" do
    assert_equal shows(:one), episodes(:one).show
  end
  
  test "episode should not be valid without a date" do
    s = Episode.create(:name => 'Test episode', :date=> nil)
    assert s.errors.on(:date)
  end
end
