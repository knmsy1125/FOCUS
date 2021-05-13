class Goal < ApplicationRecord
  has_many :tasks, inverse_of: :goal
  belongs_to :user

  accepts_nested_attributes_for :tasks, reject_if: :all_blank
end
