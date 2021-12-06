class Deliverable < ApplicationRecord
  belongs_to :project, dependent: :destroy
end
