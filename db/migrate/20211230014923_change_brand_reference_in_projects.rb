class ChangeBrandReferenceInProjects < ActiveRecord::Migration[6.1]
  def change
    remove_reference :projects, :brand, foreign_key: true
    add_reference :projects, :client, foreign_key: { to_table: :organisations }
  end
end
