class ScheduleController < ApplicationController
  before_action :fetch_schedule, only: [:done, :cancel, :destroy]

  def done
    @schedule.try(:done)
    redirect_to calendar_url
  end

  def cancel
    @schedule.try(:cancel)
    redirect_to calendar_url
  end

  def destroy
    @schedule.try(:destroy)
    redirect_to calendar_url
  end

private
  def fetch_schedule
    @schedule = current_user.schedules.find_by(id: params[:id])
  end
end
