class Goal < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :name, presence: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank
end
