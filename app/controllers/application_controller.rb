class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :user_time_zone, if: :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_sign_in, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  def check_sign_in
    redirect_to root_url if !user_signed_in? && params[:controller] != 'landing'
  end
end
