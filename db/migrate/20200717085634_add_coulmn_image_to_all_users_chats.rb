class AddCoulmnImageToAllUsersChats < ActiveRecord::Migration[6.0]
  def up
    add_column :all_users_chats, :image, :string
  end
end