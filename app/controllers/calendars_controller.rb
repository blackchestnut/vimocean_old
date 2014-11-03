class CalendarsController < ApplicationController
  def show
    @now = Time.zone.now
    @started_at = @now.beginning_of_week
    @finished_at = (@started_at + 6.days).end_of_day
    @week = (@started_at.to_date..@finished_at.to_date)
    @schedules = current_user.schedules
      .includes(:task)
      .where('schedules.started_at >= ?', @started_at)
      .where('schedules.finished_at <= ?', @finished_at)
      .order(:started_at)
  end
end
