class ChangeColumnImageToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :image, :string
  end

end
