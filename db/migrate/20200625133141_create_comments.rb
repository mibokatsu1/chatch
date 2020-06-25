class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :image
      t.integer :user_id
      t.integer :all_users_chat_id
      t.timestamps
    end
  end
end
