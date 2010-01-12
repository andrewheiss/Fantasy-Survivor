require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  test "should show index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:shows)
  end
  
  test "should show new" do
    get :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:show)
  end
  
  test "should show new form" do
    get :new
    assert_select 'form p', :count => 2
  end
  
  test "should add show" do
    post :create, :show => {
      :name => 'Test show'
    }
    assert ! assigns(:show).new_record?
    assert_redirected_to show_path(assigns(:show))
    assert_not_nil flash[:notice]
  end
  
  test "should reject missing show attribute" do
    post :create, :show => {
      :name => nil
    }
    assert assigns(:show).errors.on(:name)
  end
end
