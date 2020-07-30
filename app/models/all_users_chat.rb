class AllUsersChat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :tags, through: :all_users_chat_tags
  # has_many :all_users_chat_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
  
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

  # all_users_chatsコントローラで配列化した値を引数で受け取ります
  def save_tags(tag_list)
    tag_list.each do |tag|
      # 受け取った値を小文字に変換して、DBを検索して存在しない場合は
      # find_tag に nil が代入され nil となるのでタグの作成が始まる
      unless find_tag = Tag.find_by(text: tag.downcase)
        begin
          # create メソッドでタグの作成
          # create! としているのは、保存が成功しても失敗してもオブジェクト
          # を返してしまうため、例外を発生させたい
          self.tags.create!(text: tag)
          # @all_users_chat.tags.create!(text: tag)

        # 例外が発生すると rescue 内の処理が走り nil となるので
        # 値は保存されないで次の処理に進む
        rescue
          # binding.pry
          nil
        end
      else
            # DB にタグが存在した場合、中間テーブルにブログ記事とタグを紐付けている
        AllUsersChatTag.create!(all_users_chat_id: self.id, tag_id: find_tag.id)
      end
    end
  end
end
