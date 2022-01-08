class AddTokenToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :token, :string
  end
end
