class AddBrandToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :brand, :string
  end
end
