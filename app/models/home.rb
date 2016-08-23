class Home < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 3
end
