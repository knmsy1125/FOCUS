class WeekNoLoginMailer < ApplicationMailer
  default from: 'focus.xxxxxx@gmail.com'

  def week_no_login_email
    @user = User.all
    @user.each do |user|
      user.last_sign_in_at
      if Date.today-7 < user.last_sign_in_at
        @user = user
        @dream = user.dream
        mail(to: user.email, subject: 'welcome to my family!')
      end
    end

  end
end