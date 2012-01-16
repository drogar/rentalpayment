require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "can should be yes for admin" do  
    adm = users(:admin)
    rl = roles(:admin)
    asgn = assignments(:admin)
    adm.assignments << asgn
    rl.assignments << asgn
    assert adm.assignments.length == 1, "#{adm.email}:adm.assign = #{adm.assignments}"
    assert adm.roles.length == 1, "admroles= #{adm.roles}"
    assert adm.can?("anything","new");
    assert adm.can?("anything","create");
    assert adm.can?("anything","edit");
    assert adm.can?("anything","update");
    assert adm.can?("anything","destroy");
    assert adm.can?("anything","show");
    assert adm.can?("anything","index");
   end
   
  test "User attrs must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
  end
 
  test "email must be valid email" do
   user = User.new
   user.email = 'INVALID'
   assert user.invalid?
   assert user.errors[:email].any?, '"INVALID" is invalid email'
  # user.errors[:email].
   
   ['someone@example.com','someone2@example.com', 'someone.2@example.com','someone_2@example.com','someone-2@example.com'].each do |eml|
     user.email = eml
     assert user.invalid?
     assert user.errors[:email].empty?, "#{eml} should not be an invalid email: #{user.errors[:email]}"
   end
  end
  
  test "Admin has all roles" do
    adm = users(:admin)
    assert adm.has_role?("Administrator");
    assert adm.has_role?("whatever");
  end
  
  test "Landlord has landlord role and no other" do
    llord = users(:landlord)
    assert llord.has_role? "Landlord"
    assert (not llord.has_role? "Supports")
  end
 end
 
 
