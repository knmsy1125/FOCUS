class ApplicationController < ActionController::Base
  before_action :check
  def check
    if user_signed_in? #ログイン済みかどうか
      @user = current_user #ログインしていたら
      unless @user.goal == nil
        @end_on = @user.goal.end_on
        @today = Date.today
        if @end_on < @today #日付が過ぎている
          @user.goal.tasks.destroy_all
          current_user.goal.destroy
          redirect_to goals_path
        end
      end
    end
  end
end
