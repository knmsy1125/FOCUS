class HomesController < ApplicationController
  def top
    @inquiry = Inquiry.new
  end
end
