class InquiryMailer < ApplicationMailer
  # お問い合わせ
  def send_mail(inquiry)
    @inquiry = inquiry
    mail to: 'focus.xxxxxx@gmail.com', subject: '【FOCUS】お問い合わせ通知'
  end
end
