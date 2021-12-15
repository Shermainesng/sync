class Project < ApplicationRecord
  belongs_to :user

  has_many :users, through: :project_users, as: :clients
  has_many :deliverables, dependent: :destroy
  has_many :drafts, through: :deliverables
  belongs_to :brand, class_name: "User", foreign_key: "brand_id", dependent: :destroy

  # scope :filter_status, ->status { where("status ILIKE ?", status) }
  scope :filter_name, ->name { where("name ILIKE ?", "%#{name}%")}
  scope :status, ->status { where("status ILIKE ?", "%#{status}%")}
end
