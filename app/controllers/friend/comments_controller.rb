class Friend::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:friend_id])
    comment = UserComment.new(user_comment_params)
    #コメントされた人
    comment.user = user
    #コメントした人
    comment.commentator = current_user
    comment.save
  end

    private
    def user_comment_params
      params.permit(:comment)
    end
end
