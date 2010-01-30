class Mailer < ActionMailer::Base
  def recovery(options)
    from "Fantasy Survivor <andrewheiss@gmail.com>"
    recipients options[:email]
    subject "Account Recovery"
    content_type 'text/html'
    
    body :key => options[:key], :domain => options[:domain]
  end
end
