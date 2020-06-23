class Group < ApplicationRecord
  has_many :group_users
  # group.usersの記述で呼び出せる
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true
end