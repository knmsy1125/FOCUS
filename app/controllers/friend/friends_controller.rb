class Friend::FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @method = params[:method]
    @word = params[:word]
    @users = if @method.present? && @word.present?
    Friend.looks(@word, @method)
    else
      nil
    end
      @friends = User.where(id: current_user.friends.split(",").map(&:to_i))
  end

  def create
    # friedns => "2,3,4" "2,3"
    # ["1", "2"]
    friends = current_user.friends.split(",")
    new_friends = friends << params[:user][:friends].to_s
    # "1,2"
    current_user.friends = new_friends.join(",")
    if current_user.save
      redirect_to friends_path
    else
      render :index
    end
  end
end
