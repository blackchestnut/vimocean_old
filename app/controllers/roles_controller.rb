class RolesController < ApplicationController
  EXAMPLES = ['Wife', 'Husband', 'Child', 'Businessman', 'Family man']

  def index
    @actual_examples = actual_examples
  end

  def create
    role = Role.find_or_create_by role_params
    add_role current_user, role
    redirect_to roles_url
  end

  def destroy
    role = Role.find params[:id]
    current_user.roles.delete role
    redirect_to roles_url
  end

  def add
    role = Role.find_or_create_by name: params[:name]
    add_role current_user, role
    redirect_to roles_url
  end

private
  def role_params
    params.required(:role).permit(:name)
  end

  def actual_examples
    EXAMPLES - current_user.roles.collect { |role| role.name }
  end

  def add_role user, role
    user.roles << role unless user.roles.include?(role)
    role.save
  end
end
