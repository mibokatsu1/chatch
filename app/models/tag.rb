class Tag < ApplicationRecord
  before_save :downcase_tag_name
  
  validates :text, presence: true, uniqueness: true
  # validates :text, presence: true, uniqueness: { case_sensitive: true }

  has_many :all_users_chat_tags, dependent: :destroy
  has_many :all_users_chats, through: :all_users_chat_tags

  private

  # タグ名を小文字に変換
  def downcase_tag_name
    self.text.downcase!
  end
end