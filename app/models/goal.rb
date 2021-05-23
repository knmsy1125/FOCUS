class Goal < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :name, presence: true

  # accepts_nested_attributes_forは、親子関係のある関連モデルで、親から子を作成したり保存したりする時に使う。
  # reject_ifはパラメータが指定した条件に合致した場合、子要素を作成しない。
  accepts_nested_attributes_for :tasks, reject_if: :all_blank
end
