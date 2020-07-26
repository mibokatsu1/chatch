class Tag < ApplicationRecord
  validates :text, presence: true, uniqueness: true

  has_many :all_users_chats_tags, dependent: :destroy
  has_many :all_users_chats, through: :all_users_chats_tags
end