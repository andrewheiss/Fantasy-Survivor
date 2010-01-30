require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "recovery link should be present in the email" do
    ActionMailer::Base.deliveries.clear
    user = users(:sally)
    email = Mailer.deliver_recovery(:key => Crypto.encrypt("#{user.id}:#{user.salt}"),:email => user.email)
    
    key = Crypto.encrypt("#{user.id}:#{user.salt}")
    
    assert !ActionMailer::Base.deliveries.empty?
    
    assert_equal [user.email], email.to
    assert_equal 'Account Recovery', email.subject
    assert_match(/#{key}/, email.body)
  end
end
