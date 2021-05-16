class TodayMailer < ApplicationMailer
  default from: '管理者のメールアドレス'

  def today_email
    @user = params[:user]
    @goal = current_user.goal.tasks
    mail(to: @user.email, subject: 'welcome to my family!')
  end
end
