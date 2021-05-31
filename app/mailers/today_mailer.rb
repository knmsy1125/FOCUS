class TodayMailer < ApplicationMailer
  default from: 'focus.xxxxxx@gmail.com'

  # 毎日のメール
  def today_email
    users =  User.all
    users.each do |user|
      @goal = user.goal
      @user = user
      mail(to: user.email, subject: 'welcome to my family!')
    end
  end
end
