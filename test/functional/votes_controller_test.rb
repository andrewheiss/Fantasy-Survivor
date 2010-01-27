require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should accept new vote and redirect sans ajax" do
    assert contestants(:dwight).votes.empty?
    post_with_user :create, :episode_id => episodes(:week_three), :contestant_id => contestants(:dwight), :user_id => users(:sally)
    assert_redirected_to episode_path(episodes(:week_three))
    assert ! assigns(:contestant).votes.empty?
  end
  
  test "should render rjs after vote avec ajax" do
    assert contestants(:dwight).votes.empty?
    xml_http_request :post_with_user, :create, :episode_id => episodes(:week_three), :contestant_id => contestants(:dwight), :user_id => users(:sally)
    assert_response :success
    assert_template 'create'
    assert ! assigns(:contestant).votes.empty?
  end
  
  test "should store user with vote" do
    post_with_user :create, { :episode_id => episodes(:week_three), :contestant_id => contestants(:dwight) }, :user_id => users(:sally)
    assert_equal users(:sally), assigns(:vote).user
  end
end
