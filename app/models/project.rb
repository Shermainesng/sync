class Project < ApplicationRecord
  belongs_to :user
  has_many :users, through: :project_users
end
