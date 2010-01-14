require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should show login form" do
    get :new
    assert_response :success
    assert_template 'new'
    assert_select 'form p', 4
  end
  
  test "should perform user login" do
    post :create, :login => 'sally', :password => 'secret'
    assert_redirected_to shows_path
    assert_equal users(:sally).id, session[:user_id]
    assert_equal users(:sally), assigns(:current_user)
  end
  
  test "should fail user login" do
    post :create, :login => 'bad', :password => 'wrong'
    assert_response :success
    assert_template 'new'
    assert_nil session[:user_id]
  end
  
  test "should redirect after login with return url" do
    post :create, { :login => 'sally', :password => 'secret' }, :return_to => '/shows'
    assert_redirected_to '/shows'
  end
  
  test "should logout and clear session" do
    post :create, :login => 'sally', :password => 'secret'
    assert_not_nil assigns(:current_user)
    assert_not_nil session[:user_id]
    
    delete :destroy
    assert_response :success
    assert_template 'destroy'
    assert_select 'h2', 'Logout successful'
    assert_nil assigns(:current_user)
    assert_nil session[:user_id]    
  end
  
end
