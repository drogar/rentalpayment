class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :check_auth
  
  private
  def check_auth
    unless current_user.can?(action_name, controller_name)
      redirect_to :back, :error => "You are not authorized for the page/action you requested."
    end
  end
  
end
