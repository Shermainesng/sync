class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :draft

  has_many :sent_replies, class_name: "Reply", foreign_key: "sender_id"
  has_many :replies, class_name: "Reply", foreign_key: "receiver_id"
end
