require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should log in" do
    post :create, :session => { 
      :login => users(:john).login,
      :password => 'test1'
    }   
    assert_not_nil session[:id]
    assert_redirected_to root_url
  end
  
  test "should log out" do
    post :create, :session => { 
      :login => users(:john).login,
      :password => 'test1'
    }
    delete :destroy, :id => session[:id]
    assert_nil session[:id]
    assert_redirected_to root_url
    assert_equal flash[:notice], 'You are now logged out'
  end
  
  test "should redirect to password update form" do
    user = users(:sally)
    hash = Crypto.encrypt("#{user.id}:#{user.salt}")
    
    assert session.empty?
    
    get :recovery, :id => hash
    
    assert_not_nil session[:id]
    assert_equal "Please change your password", flash[:notice]
    assert_redirected_to edit_user_path('account')
  end
  
  test "should handle bogus or invalid hash key" do
    get :recovery, :id => '098sdfglkewr9gd0plk'
    assert session[:id].nil?
    assert_equal "The recovery link given is not valid", flash[:notice]
    assert_redirected_to root_url
  end
end
