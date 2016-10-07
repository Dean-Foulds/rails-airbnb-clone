class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :disable_welcome_email

  after_create :subscribe_to_newsletter


  has_many :homes

  has_attachment :avatar

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end
