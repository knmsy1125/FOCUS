class Fan < ApplicationRecord
  belongs_to :user
  belongs_to :sopporter, class_name: "User"
end
