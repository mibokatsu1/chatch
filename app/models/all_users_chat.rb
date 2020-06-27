class AllUsersChat < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: true

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
    if(last_image = @images.last).present?
      last_image
    else
      'まだ画像はありません。'
    end
  end

end
