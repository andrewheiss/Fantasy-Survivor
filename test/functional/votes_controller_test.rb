require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should accept new vote and redirect sans ajax" do
    assert contestants(:dwight).votes.empty?
    post :create, :episode_id => episodes(:week_two), :contestant_id => contestants(:dwight)
    assert_redirected_to episode_path(episodes(:week_two))
    assert ! assigns(:contestant).votes.empty?
  end
  
  test "should render rjs after vote avec ajax" do
    xml_http_request :post, :create, :episode_id => episodes(:week_two), :contestant_id => contestants(:dwight)
    assert_response :success
    assert_template 'create'
  end
end
