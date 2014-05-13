class RolesController < ApplicationController
  def index
    @roles = Role.where(user: current_user)
  end
end
