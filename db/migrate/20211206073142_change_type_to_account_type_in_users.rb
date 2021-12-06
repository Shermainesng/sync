class ChangeTypeToAccountTypeInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :type, :account_type
  end
end
