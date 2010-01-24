require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should show list of users" do
    get_with_user :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:users)
  end
  
  test "should show new user form, but only if not logged in" do
    get :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:user)
    assert_select 'form label', :count => 5
  end
  
  test "should show edit form" do
    get_with_user :edit, :id => users(:sally).id
    assert_response :success
    assert_template :edit
    assert_not_nil assigns(:user)
    assert_select 'form label', :count => 5
  end
  
  test "should show indivdual user page" do
    get_with_user :show, :id => users(:sally)
    assert_response :success
    assert_template :show
    assert_select 'h2#user_name', users(:sally).name
  end
  
  test "should add new user, but only if not logged in" do
    post :create, :user => { 
      :name => 'Test user',
      :email => 'test@test.com',
      :login => 'test',
      :password => 'testpassword',
      :password_confirmation => 'testpassword' 
      }
    assert ! assigns(:user).new_record?
    assert_redirected_to root_path
    assert_not_nil flash[:notice]
  end
  
  test "should reject missing user attribute" do
    post :create, :user => {
      :name => nil
    }
    assert assigns(:user).errors.on(:name)
  end
end
