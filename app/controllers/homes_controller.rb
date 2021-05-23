class HomesController < ApplicationController
  def top
    # お問い合わせ
    @inquiry = Inquiry.new
  end
end
