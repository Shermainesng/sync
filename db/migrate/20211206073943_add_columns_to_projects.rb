class AddColumnsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :name, :string
    add_column :projects, :project_end, :date
    add_column :projects, :status, :string
    add_column :projects, :description, :text
    add_reference :projects, :user, foreign_key: true
  end
end
