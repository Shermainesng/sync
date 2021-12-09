class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :sender, foreign_key: {to_table: :comments}
      t.references :receiver, foreign_key: {to_table: :comments}

      t.timestamps
    end
  end
end
