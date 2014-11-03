class TasksController < ApplicationController
  def new
    @started_at = params[:date] ? Time.zone.parse(params[:date]) : Time.zone.now
    @started_at = Time.zone.now if @started_at.today?
    @finished_at = @started_at + 1.hour
    @schedule = Schedule.new(user: current_user, started_at: @started_at, finished_at: @finished_at)
    @scheduled_task_form = ScheduledTaskForm.new(current_user, @schedule)
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
