class CreateProjectsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_tables do |t|
      t.string :name
      t.date :project_end
      t.string :status
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
