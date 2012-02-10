require 'spec_helper'

describe Role do
  context "basic validations" do
    before(:each) do
      @role = Role.new
    end
    context "must not be empty" do
      specify {@role.should_not be_valid; @role.errors[:role_name].should_not be_empty}
      specify {@role.should_not be_valid; @role.errors[:description].should_not be_empty}
    end
  end
  context "should only say 'Administrator' is an admin" do
    before(:each) do
      @role = Role.new
    end
    it "should be the case that an 'Administrator is an admin" do
      @role.role_name = 'Administrator'
      @role.should be_an_admin
    end
    it "should say all other roles are NOT admins" do
      ['Admin', 'Landlord', 'Tenant', 'Support', 'Accountant', 'Anything'].each do |r|
        @role.role_name = r
        @role.should_not be_an_admin
      end
    end
  end
end
