class CreateDeliverables < ActiveRecord::Migration[6.1]
  def change
    create_table :deliverables do |t|
      t.references :project
      t.string :type
      t.date :due_date
      t.text :description

      t.timestamps
    end
  end
end
