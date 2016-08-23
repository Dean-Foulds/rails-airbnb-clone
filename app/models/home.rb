class Home < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 3

  STATUS = %w(pending, available, viewing, tenancy)

  validates :name, presence: true
  validates :status, inclusion: { in: STATUS }

end
