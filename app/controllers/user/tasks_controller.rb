class User::TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @goal = current_user.goal
    @goal.tasks.build
    @task = Task.new
    @goals = Goal.where(user_id: current_user.id)
    @task.save
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.goal.tasks.build(task_params)
    if @task.save
      # 登録後ユーザーページに飛びflash表示
      redirect_to show_users_path, flash: {success: "タスクを登録しました。"}
    else
      @tasks = Task.where(user_id: current_user.id)
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      # 更新後ユーザーページに飛びflash表示
      redirect_to show_users_path, flash: {success: "タスクを更新しました。"}
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # 削除後ユーザーページに飛びflash表示
    redirect_to show_users_path, flash: {success: "タスクを削除しました。"}
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :count, :count_out)
  end
end
