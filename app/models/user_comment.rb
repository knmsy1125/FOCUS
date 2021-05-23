class UserComment < ApplicationRecord
  belongs_to :user

  # class_nameは関連名と参照先のクラス名を異なるものにしたい場合に指定
  belongs_to :commentator, class_name: "User"
end
