class InquiriesController < ApplicationController

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      redirect_to root_path
      flash[:email] = "お問い合わせ内容を管理者に送信しました。"

  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
