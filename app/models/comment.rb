class Comment < ApplicationRecord
  belongs_to :all_users_chat
  belongs_to :user

  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
