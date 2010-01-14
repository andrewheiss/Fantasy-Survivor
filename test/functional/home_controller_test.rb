require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should show index" do
    get :index
    assert_response :success
    assert_template :index
  end
  
  test "should indicate not logged in" do
    get :index
    assert_select 'div#login_logout em', 'Not logged in.'
  end
  
  test "should indicate logged in user" do
    get_with_user :index
    assert_equal users(:sally), assigns(:current_user)
    assert_select 'div#login_logout em a', '(Logout)'
  end
end
