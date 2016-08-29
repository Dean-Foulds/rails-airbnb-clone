class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail to: "to@example.org"
  end
end

