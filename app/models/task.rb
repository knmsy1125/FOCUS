class Task < ApplicationRecord
  has_many :weights
  belongs_to :task_list
end
