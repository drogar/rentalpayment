class HomeController < ApplicationController
  
  skip_before_filter  :authenticate_user!
  skip_before_filter :check_auth
  def index
  end
end
