ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

gem 'minitest'


class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all #:users, :salutations, :property_types, :people, :roles, :rights, :assignments, :grants

  # Add more helper methods to be used by all tests here...
  def login_as_admin
    sign_in(users(:admin))
  end
  
  def login_as_landlord
    sign_in(users(:landlord))
  end
  
  def login_as_landlord
    sign_in(users(:support))
  end
  
  def set_referrer_to_slash
    request.env["HTTP_REFERER"] = "/"
  end
end
