class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  include CommonActions
  before_action :set_categories

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
