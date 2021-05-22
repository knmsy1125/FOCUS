class Friend::FansController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:friend_id])
    fan = Fan.new(fan_params)
    #応援された人
    fan.user = user
    #応援した人
    fan.sopporter = current_user
    fan.save

  end

    private
    def fan_params
      params.permit(:fan)
    end
end
