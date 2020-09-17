class ApplicationMailer < ActionMailer::Base
  default from: 'my_from_address@gmail.com'
  layout 'mailer'
end
