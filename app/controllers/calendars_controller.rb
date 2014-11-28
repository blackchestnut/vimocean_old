class CalendarsController < ApplicationController
  helper_method :started_at_prev_week
  helper_method :started_at_next_week

  def show
    @started_at = started_at_from_params
    @finished_at = (@started_at + 6.days).end_of_day
    @week = (@started_at.to_date..@finished_at.to_date)
    @schedules = current_user.schedules
      .includes(:task)
      .where('schedules.started_at >= ?', @started_at)
      .where('schedules.finished_at <= ?', @finished_at)
      .order(:started_at)
  end

  private

  def started_at_from_params
    if params[:from].present?
      Time.parse(params[:from])
    else
      Time.current.beginning_of_week
    end
  end

  def started_at_prev_week
    (@started_at - 7.days).strftime('%Y-%m-%d')
  end

  def started_at_next_week
    (@started_at + 7.days).strftime('%Y-%m-%d')
  end
end
