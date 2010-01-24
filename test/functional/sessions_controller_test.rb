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
end
