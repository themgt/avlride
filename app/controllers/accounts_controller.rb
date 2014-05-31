class AccountsController < ApplicationController
  def show
  end
  
  def update
    raise "wtf"
    current_user.update_attributes(permitted_params)
    redirect_to '/account', notice: "Updated Profile"
  end
  
  protected
  def permitted_params
    params[:user].permit()
  end
end