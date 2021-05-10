class User::GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goal = current_user.goals.new
    @goals = Goal.where(user_id: current_user.id)
  end

  def new
  end

  def show
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @task_list = @goal.task_lists.new(total_score: "1")
    @task = @task_list.tasks.new(title: params[:goal][:title], boby: params[:goal][:boby])
    if @goal.save
      redirect_to show_users_path, flash: {success: "ゴールフォーカスを登録しました！"}
    else
      @goals = Goal.where(user_id: current_user.id)
      render :index
    end
  end

  # 配送先編集画面
  def edit
  end

  # 配送先編集画面 => 配送先更新
  def update
    if @goal.update(goal_params)
      redirect_to goals_path, flash: {success: "ゴールフォーカスを更新しました！"}
    else
      render :edit
    end
  end

  # 配送先登録/一覧画面 => 配送先削除
  def destroy
    @goal.destroy
    redirect_to goalss_path, flash: {success: "ゴールフォーカスを更新しました"}
  end

  private

  def set_shipping_info
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :end_on)
  end

end
