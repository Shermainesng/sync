class Draft < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  belongs_to :deliverable
  has_many :comments, dependent: :destroy
  belongs_to :user
end
