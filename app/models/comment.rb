class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :draft

  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
end
