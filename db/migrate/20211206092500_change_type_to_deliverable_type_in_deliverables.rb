class ChangeTypeToDeliverableTypeInDeliverables < ActiveRecord::Migration[6.1]
  def change
    rename_column :deliverables, :type, :deliverable_type
  end
end
