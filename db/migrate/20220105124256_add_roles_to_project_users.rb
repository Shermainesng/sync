class AddRolesToProjectUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :project_users, :role, :string
  end
end
