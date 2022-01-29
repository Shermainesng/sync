class ProjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :role, optional: true
end
