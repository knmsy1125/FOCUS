class Goal < ApplicationRecord
  has_many :task_lists
  belongs_to :user
end
