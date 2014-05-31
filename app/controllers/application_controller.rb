class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def after_sign_in_path_for(resource_or_scope)
    '/rides'
  end

  def after_sign_out_path_for(resource_or_scope)
  	'/users/sign_in'
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
