class AllUsersChat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :tags, through: :all_users_chat_tags
  # has_many :all_users_chat_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  
  def show_last_comment
    if (last_comment = comments.last).present?
      if last_comment.content?
        last_comment.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

  def show_last_image
    @images = Comment.select("image")
    last_image = @images.last
  end

  def self.search(search)
    if search
      AllUsersChat.where('name LIKE(?)', "%#{search}%")
    else
      AllUsersChat.all
    end
  end

  # def self.search(search)
  #   if search
  #     AllUsersChat.where('tag_list LIKE(?)', "%#{search}%")
  #   else
  #     AllUsersChat.all
  #   end
  # end

end
