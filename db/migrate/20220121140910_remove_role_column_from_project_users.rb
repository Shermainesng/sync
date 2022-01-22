class RemoveRoleColumnFromProjectUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :project_users, :role, :string
  end
end
