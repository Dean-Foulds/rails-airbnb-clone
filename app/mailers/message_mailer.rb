class MessageMailer < ApplicationMailer
  default from: "Your Mailer <deanfoulds@posteo.de>"
  default to: "Your Name <deanfoulds@posteo.de>"

  def new_message(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end
end
