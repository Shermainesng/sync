class Project < ApplicationRecord
  belongs_to :user

  has_many :users, through: :project_users, as: :clients
  has_many :deliverables, dependent: :destroy

  # scope :filter_status, ->status { where("status ILIKE ?", status) }
  scope :filter_name, ->name { where("name ILIKE ?", "%#{name}%")}
  scope :status, ->status { where("status ILIKE ?", "%#{status}%")}
end
