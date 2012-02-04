class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :check_auth
  
  private
  def check_auth
    if current_user
      puts "Got user #{current_user.email}. Roles: #{current_user.roles}"
      unless current_user.can?(action_name, controller_name)
        redirect_to :back, :error => "You are not authorized for the page/action you requested."
      end
    else 
      puts 'No current user!!!!'
      return false
    end
  end
  
end
