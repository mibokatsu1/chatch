class Group < ApplicationRecord
  has_many :group_users
  # group.usersの記述で呼び出せる
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

  def show_last_messenger
    if (last_message = messages.last).present?
      last_message.user.name
    else
      '--'
    end
  end

  def show_last_message_created_at
    if (last_message = messages.last).present?
      last_message.created_at.strftime("%Y年%m月%d日 %H時%M分")
    else
      '--'
    end
  end

end