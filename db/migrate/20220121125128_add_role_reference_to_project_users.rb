class AddRoleReferenceToProjectUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :project_users, :role, foreign_key: true
  end
end
