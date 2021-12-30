class ChangeBrandReferenceInProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :brand_id, :integer
    add_reference :projects, :client, foreign_key: { to_table: :organisations }
  end
end
