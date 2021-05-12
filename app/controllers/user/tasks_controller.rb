class User::TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @task = current_user.tasks.new
    @tasks = Task.where(user_id: current_user.id)
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to show_users_path, flash: {success: "タスクを更新しました！"}
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to show_users_path #削除に成功すればrootページに戻る
  end

  private

  def set_shipping_info
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :boby, :count, :count_out)
  end
end
