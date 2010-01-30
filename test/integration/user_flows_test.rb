require 'test_helper'

class UserFlowsTest < ActionController::IntegrationTest
  # fixtures :all
  # 
  # test "should e-mail password recovery link" do
  #   user = users(:sally)
  #   get help_users_path
  #   assert_response :success
  #   
  #   post_via_redirect recover_users_path, :login => user.login
  #   assert_equal root_path, path
  #   assert_equal "Please check your e-mail", flash[:notice]
  #   
  #   key = Crypto.encrypt("#{user.id}:#{user.salt}")
  #   
  #   assert !ActionMailer::Base.deliveries.empty?
  #   email = ActionMailer::Base.deliveries.first
  #   
  #   assert_equal [user.email], email.to
  #   assert_equal 'Account Recovery', email.subject
  #   assert_match(/#{key}/, email.body)
  # end
end
