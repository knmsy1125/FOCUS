class User::GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goal = current_user.build_goal
    @goal.tasks.build
    @goals = Goal.where(user_id: current_user.id)
  end

  def show
    @goal = Goal.find(params[:id])
    @user_comments = current_user.user_comments
    @fan_count = Fan.where(user_id: current_user.id).count
  end

  def create
    @goal = current_user.build_goal(goal_params)
    #@task = @goal.tasks.new(title: params[:goal][:title], boby: params[:goal][:boby])
    if @goal.save
      redirect_to show_users_path, flash: {success: "登録しました！"}
    else
      @goals = Goal.where(user_id: current_user.id)
      render :index
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, flash: {success: "更新しました！"}
    else
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :end_on, tasks_attributes: [:id,:title, :body,:_destroy])
  end

end
