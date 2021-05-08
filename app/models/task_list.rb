class TaskList < ApplicationRecord
  has_many :tasks
  belongs_to :goal
end
