class WeekNoLoginMailer < ApplicationMailer
  default from: 'focus.xxxxxx@gmail.com'

  def week_no_login_email
    @user = params[:user]
    @dream = @user.dream
    mail(to: @user.email, subject: 'welcome to my family!')
  end
end