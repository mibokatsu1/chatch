class DropTag < ActiveRecord::Migration[6.0]
  def up
    # remove_reference :all_users_chats, :
    drop_table :tags
  end
  def down
    create_table :tags do |t|
      t.text :text,    null: false
      t.timestamps
    end
  end
end
