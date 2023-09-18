# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar dob gender])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar dob gender])
  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = 'You are not authorized to perform this task'
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: { 'message' => 'User is not authorised for this action!' }, status: 401
    p exception
  end

  # rescue_from ActiveRecord::RecordInvalid do |exception|
  #   render json: { 'message' => 'Please enter string value.' }, status: 401
  #   p exception
  # end
end
