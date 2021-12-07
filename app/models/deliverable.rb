class Deliverable < ApplicationRecord
  belongs_to :project
  has_many :drafts, dependent: :destroy
end
