class User::GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goal = current_user.build_goal
    @goal.tasks.build
    @goals = Goal.where(user_id: current_user.id)
  end

  def create
    @goal = current_user.build_goal(goal_params)
    if @goal.save
      # 登録後ユーザーページに飛びflash表示
      redirect_to show_users_path, flash: {success: "ゴールフォーカス・タスクを登録しました。"}
    else
      @goals = Goal.where(user_id: current_user.id)
      render :index
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :end_on, tasks_attributes: [:id,:title, :body,:_destroy])
  end

end
