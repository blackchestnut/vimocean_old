class CalendarsController < ApplicationController
  def show
    @date = Time.zone.today
    @first_date = @date.beginning_of_week
    @last_date = @first_date + 6
    @week = (@first_date..@last_date)
  end
end
