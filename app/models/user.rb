class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_one :goal
  has_many :fans
  has_many :user_comments

  attachment :profile_image

  # ゲスト
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def self.week_no_login_email
    User.all.each do |user|
      if Date.today-7 < user.last_sign_in_at
        WeekNoLoginMailer.with(user: user).week_no_login_email.deliver
      end
    end
  end
end
