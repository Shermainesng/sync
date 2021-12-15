class RemoveBrandColumnFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :brand, :string
  end
end
