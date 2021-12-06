class Project < ApplicationRecord
  belongs_to :user
  has_many :users, through: :project_users
  has_many :deliverables
end
