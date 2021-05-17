class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :commentator, class_name: "User"
end
