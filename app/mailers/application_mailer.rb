class ApplicationMailer < ActionMailer::Base
  default from: "Your Mailer <sociallettings@gmail.com>"
  default to: "Your Name <sociallettings@gmail.com>"
  layout 'mailer'
end
