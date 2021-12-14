class AddAttachmentsToDrafts < ActiveRecord::Migration[6.1]
  def change
    add_column :drafts, :attachments, :json
  end
end
