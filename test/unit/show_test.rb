require 'test_helper'

class ShowTest < ActiveSupport::TestCase
  test "show should not be valid without a name" do
    s = Show.create(:name => nil)
    assert s.errors.on(:name)
  end
  
  test "should create contestant" do
    s = Show.create(:name => 'Test Show')
    assert s.valid?
  end
  
  test "should be associated with contestants" do
    assert_equal [ contestants(:jim), contestants(:dwight) ], shows(:one).contestants
  end
  
  test "should delete contestants after deleting the show" do
    s = Show.create(:name => 'Delete me')
    c = Contestant.create(:name => 'Contestant 1', :show_id => s.id)
    assert Contestant.exists?(c.id)     # Now you see it...
    s.destroy
    assert ! Contestant.exists?(c.id)   # ... now you don't!
  end
end
