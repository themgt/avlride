class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  protect_from_forgery with: :exception

  private
  def after_sign_in_path_for(resource_or_scope)
    '/neighborhoods'
  end

  def after_sign_out_path_for(resource_or_scope)
  	'/users/sign_in'
  end
end
