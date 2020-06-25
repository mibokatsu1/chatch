class CreateAllUsersChats < ActiveRecord::Migration[6.0]
  def change
    create_table :all_users_chats do |t|
      t.string :name
      t.index :name, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
