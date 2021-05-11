class Task < ApplicationRecord
  has_many :weights
  belongs_to :goal
end
