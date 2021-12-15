class AddReferenceToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :brand, foreign_key: { to_table: :users}
  end
end
