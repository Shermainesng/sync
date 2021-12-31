class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  belongs_to :organisation
  has_and_belongs_to_many :projects, join_table: :project_users

  has_many :projects, as: :owner, dependent: :destroy
  has_many :deliverables, through: :projects
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :paid_projects, class_name: "Project", foreign_key: "brand_id", dependent: :destroy

  validates :username, presence: true, uniqueness: true

end
