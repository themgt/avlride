class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception

  private
  def after_sign_in_path_for(resource_or_scope)
    '/neighborhoods'
  end

  def after_sign_out_path_for(resource_or_scope)
  	'/users/sign_in'
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:name, :current_password, :password, :password_confirmation, :home_neighborhood_id, :work_neighborhood_id) }
  end
end
