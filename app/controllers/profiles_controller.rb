class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(profile_params)
      redirect_to dashboard_url
    else
      render 'edit'
    end
  end

private
  def profile_params
    params
      .required(:user)
      .permit(:name)
  end
end
