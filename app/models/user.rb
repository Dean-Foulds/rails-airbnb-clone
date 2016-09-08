class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :disable_welcome_email

  after_create :send_welcome_email


  has_many :homes

  has_attachment :avatar

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now unless self.disable_welcome_email
  end
end
