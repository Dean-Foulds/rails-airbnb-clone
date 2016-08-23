class Home < ApplicationRecord
  belongs_to :user
  has_attachments :pictures, maximum: 3
end
