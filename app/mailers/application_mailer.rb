class ApplicationMailer < ActionMailer::Base
  default from: "Your Mailer <deanfoulds@posteo.de>"
  default to: "Your Name <deanfoulds@posteo.de>"
  layout 'mailer'
end
