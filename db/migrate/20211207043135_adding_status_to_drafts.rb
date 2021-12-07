class AddingStatusToDrafts < ActiveRecord::Migration[6.1]
  def change
    add_column :drafts, :status, :string
  end
end
