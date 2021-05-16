class User::IsDonesController < ApplicationController
  def excute
    is_done = IsDone.where(task_id: params[:task_id], execution: Date.today).first
    if !is_done
      is_done = IsDone.new
      is_done.task_id = params[:task_id]
      is_done.execution = Date.today
      is_done.save
    else
      is_done.destroy
    end
    render json: { data: true }
  end
end
