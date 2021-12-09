class Reply < ApplicationRecord
  belongs_to :receiver, class_name: "Comment", foreign_key: "receiver_id"
  has_one :sender, class_name: "Comment", foreign_key: "sender_id"

end
