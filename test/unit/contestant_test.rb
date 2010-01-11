require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  test "should not be valid without a name" do
    c = Contestant.create(:name => nil)
    assert c.errors.on(:name)
  end
  
  test "should create contestant" do
    c = Contestant.create(:name => 'Test contestant')
    assert c.valid?
  end
end
