class Deliverable < ApplicationRecord
  belongs_to :project
  has_many :drafts, dependent: :destroy
  has_many :comments, through: :drafts


  acts_as_taggable_on :tags

  def status
    if self.drafts.empty?
      "in progress"
    elsif self.drafts.last.status=="approved"
        "approved"
    else
      "in progress"
    end
  end

  def project_status
    self.project.status
  end

end
