require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  test "should show index" do
    get_with_user :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:shows)
  end
  
  test "should show new" do
    get_with_user :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:show)
  end
  
  test "should show new form" do
    get_with_user :new
    assert_select 'form p', :count => 2
  end
  
  test "should add show" do
    post_with_user :create, :show => {
      :name => 'Test show'
    }
    assert ! assigns(:show).new_record?
    assert_redirected_to show_path(assigns(:show))
    assert_not_nil flash[:notice]
  end
  
  test "should reject missing show attribute" do
    post_with_user :create, :show => {
      :name => nil
    }
    assert assigns(:show).errors.on(:name)
  end
  
  test "should redirect if not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to login_path
  end
  
end
