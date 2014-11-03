class DashboardsController < ApplicationController
  def show
    @overdue_schedules = current_user.schedules.includes(:task).where(state: :pending).where('finished_at <= ?', Time.zone.now)
    @closest_schedules = current_user.schedules.includes(:task).where(state: :pending).where('finished_at > ?', Time.zone.now).where('started_at < ?', Time.zone.tomorrow)
    @tomorrow_schedules = current_user.schedules.includes(:task).where(state: :pending).where('started_at >= ?', Time.zone.tomorrow).where('started_at <= ?', Time.zone.tomorrow.end_of_day)
  end
end
