class TasksController < ApplicationController
  def new
    @scheduled_task_form = ScheduledTaskForm.new current_user
  end

  def create
    @scheduled_task_form = ScheduledTaskForm.new current_user
    if @scheduled_task_form.submit task_params
      redirect_to calendar_url
    else
      render action: :new
    end
  end

private
  def task_params
    params.require(:task).permit :name, :started_at, :finished_at
  end
end
