class User::GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goal = current_user.build_goal
    @goal.tasks.build
    @goals = Goal.where(user_id: current_user.id)
  end

  def new
  end

  def show
    @goal = Goal.find(params[:id])
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

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, flash: {success: "更新しました！"}
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goalss_path, flash: {success: "更新しました"}
  end

  private

  def set_shipping_info
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :end_on, tasks_attributes: [:id,:title, :body,:_destroy])
  end

end
