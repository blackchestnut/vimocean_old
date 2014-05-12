class MissionsController < ApplicationController
  before_action :fetch_mission, only: [:show, :edit, :update]

  def show
  end

  def new
    if current_user.mission
      redirect_to edit_mission_url current_user.mission
    else
      @mission = Mission.new
    end
  end

  def create
    @mission = Mission.new mission_params
    @mission.user = current_user
    if @mission.save
      redirect_to dashboard_url
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @mission.update_attributes mission_params
      redirect_to dashboard_url
    else
      render action: :new
    end
  end

private
  def mission_params
    params.require(:mission).permit :text
  end

  def fetch_mission
    @mission = Mission.where(user_id: current_user, id: params[:id]).first
  end
end
