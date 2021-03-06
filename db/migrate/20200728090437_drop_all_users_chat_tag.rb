class DropAllUsersChatTag < ActiveRecord::Migration[6.0]
  def up
    drop_table :all_users_chat_tags
  end
  def down
    create_table :all_users_chat_tags do |t|
      t.references :all_users_chat, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end