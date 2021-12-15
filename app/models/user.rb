class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :deliverables, through: :projects
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy


  validates :username, presence: true, uniqueness: true
  validates :account_type, presence: true

end
