class RolesController < ApplicationController
  EXAMPLES = ['Wife', 'Husband', 'Child', 'Businessman', 'Family man']

  def index
    @actual_examples = actual_examples
  end

  def create
    role = Role.find_or_create_by role_params
    current_user.roles << role unless current_user.roles.include?(role)
    role.save
    redirect_to roles_url
  end

  def destroy
    role = Role.find params[:id]
    current_user.roles.delete role
    redirect_to roles_url
  end

private
  def role_params
    params.required(:role).permit(:name)
  end

  def actual_examples
    EXAMPLES - current_user.roles.collect { |role| role.name }
  end
end
