class ChangeUploadsToAttachmentInDrafts < ActiveRecord::Migration[6.1]
  def change
    rename_column :drafts, :upload, :attachment
  end
end
