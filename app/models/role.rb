class Role < ApplicationRecord
  has_secure_token :role_token

  has_many :project_users
end
