class WeekNoLoginMailer < ApplicationMailer
  default from: '管理者のメールアドレス'

  def week_no_login_email
    @user = User.all
    @user.each do |user|
      user.current_sign_in_at
      #if Date.today-7 < user.curent_sign_in_at
        @dream = current_user.dream
        mail(to: @user.email, subject: 'welcome to my family!')
      #end
    end

  end
end