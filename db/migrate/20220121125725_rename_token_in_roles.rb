class RenameTokenInRoles < ActiveRecord::Migration[6.1]
  def change
    rename_column :roles, :token, :role_token
  end
end
