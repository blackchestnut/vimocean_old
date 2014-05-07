class LandingController < ApplicationController
  before_action :check_authorize

  def index
    @user = User.new
  end

private
  def check_authorize
    redirect_to dashboard_url if current_user
  end
end
