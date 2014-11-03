class TasksController < ApplicationController
  def new
    @scheduled_task_form = ScheduledTaskForm.new current_user
  end

  def create
    @scheduled_task_form = ScheduledTaskForm.new current_user
    if @scheduled_task_form.submit scheduled_task_params
      redirect_to calendar_url
    else
      render action: :new
    end
  end

  # After submit routing to create action.
  def edit
    @schedule = current_user.schedules.includes(:task).find(params[:id])
    @scheduled_task_form = ScheduledTaskForm.new current_user, @schedule
    render action: :new
  end

private
  def scheduled_task_params
    params
      .require(:task)
      .permit(:id, :name, :started_at, :finished_at)
  end
end
