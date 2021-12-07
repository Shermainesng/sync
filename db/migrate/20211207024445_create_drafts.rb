class CreateDrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :drafts do |t|
      t.references :user
      t.references :deliverable
      t.string :upload
      t.text :description

      t.timestamps
    end
  end
end
