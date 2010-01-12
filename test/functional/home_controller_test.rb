require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should show index" do
    get :index
    assert_response :success
    assert_template :index
  end
end
