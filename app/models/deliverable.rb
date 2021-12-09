class Deliverable < ApplicationRecord
  belongs_to :project
  has_many :drafts, dependent: :destroy

  acts_as_taggable_on :tags
  acts_as_taggable_on :details, :type #categories
end
