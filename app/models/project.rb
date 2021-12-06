class Project < ApplicationRecord
  belongs_to :user, as: :owner
end
