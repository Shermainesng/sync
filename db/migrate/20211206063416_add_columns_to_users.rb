class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :profile_pic, :string
  end
end
