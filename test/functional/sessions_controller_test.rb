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
end
