require 'test_helper'

class ContestantsControllerTest < ActionController::TestCase
  test "should show index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:contestant)
  end
  
  test "should show new" do
    get :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:contestant)
  end
  
  test "should show new form" do
    get :new
    assert_select 'form p', :count => 2
  end
  
  test "should add contestant" do
    post :create, :contestant => {
      :name => 'Test contestant'
    }
    assert ! assigns(:contestant).new_record?
    assert_redirected_to contestants_path
    assert_not_nil flash[:notice]
  end
  
  test "should reject missing contestant attribute" do
    post :create, :contestant => {
      :name => nil
    }
    assert assigns(:contestant).errors.on(:name)
  end
end
