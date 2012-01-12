require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  
  
  test "Role attrs must not be empty" do
     role = Role.new
     assert role.invalid?
     assert role.errors[:role_name].any?
     assert role.errors[:description].any?
  end

  test "Only 'Administrator' is an admin" do
    role = Role.new
    role.role_name = 'Administrator'
    assert role.admin?
    
    role.role_name = 'Admin'
    assert (not role.admin?)
    role.role_name = 'Landlord'
    assert (not role.admin?)
    role.role_name = 'Support'
    assert (not role.admin?)
    
    role.role_name = 'Accountant'
    assert (not role.admin?)
  end
  
end
