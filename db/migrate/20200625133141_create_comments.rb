class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :image
      t.references :user, foreign_key: true
      t.references :all_users_chat, foreign_key: true
      t.timestamps
    end
  end
end
