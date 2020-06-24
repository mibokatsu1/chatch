class AddImageToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :image, :string
  end

end
