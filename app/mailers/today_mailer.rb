class TodayMailer < ApplicationMailer
  default from: 'focus.xxxxxx@gmail.com'

  def today_email
    users =  User.all
    users.each do |user|
      @goal = user.goal.tasks
      mail(to: user.email, subject: 'welcome to my family!')
    end
  end
end
