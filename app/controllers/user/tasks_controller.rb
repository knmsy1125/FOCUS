class User::TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @task = current_user.tasks.new
    @tasks = Task.where(user_id: current_user.id)
  end

  def new
  end

  def show
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, flash: {success: "タスクを登録しました！"}
    else
      @tasks = Task.where(user_id: current_user.id)
      render :index
    end
  end

  # 配送先編集画面
  def edit
  end

  # 配送先編集画面 => 配送先更新
  def update
    if @task.update(task_params)
      redirect_to goals_path, flash: {success: "タスクを更新しました！"}
    else
      render :edit
    end
  end

  # 配送先登録/一覧画面 => 配送先削除
  def destroy
    @task.destroy
    redirect_to goalss_path, flash: {success: "タスクを更新しました"}
  end

  private

  def set_shipping_info
    @task = Task.find(params[:id])
  end

  def goal_params
    params.require(:task).permit(:title, :boby)
  end
end
