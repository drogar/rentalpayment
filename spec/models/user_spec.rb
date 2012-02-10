require 'spec_helper'

describe User do
  context "basic validations" do
    before(:each) do
      @user = User.new
    end
    context "must not be empty" do
      specify {@user.should_not be_valid; @user.errors[:email].should_not be_empty}
    end
    context "emails must be valid emails " do
      it "rejects invalid emails" do
        @user.email = 'INVALID'
        @user.should_not be_valid
        @user.errors[:email].should_not be_empty
      end
      it "allows valid emails" do
        ['someone@example.com','someone2@example.com', 'someone.2@example.com','someone_2@example.com','someone-2@example.com'].each do |eml|
          @user.email = eml
          @user.should_not be_valid
          @user.errors[:email].should be_empty
        end
      end
    end
  end
  context "authorizations" do
    context "Admins have all authorization " do
      before(:each) do
        @user = Factory.create(:user)
        @admin = Factory.create(:role, :role_name => "Administrator")
        @admin.users << @user
      end
      specify {@user.assignments.should have(1).thing}
      specify {@user.roles.should have(1).user}
      specify {@user.should be_authorized_for("anything","new")}
      specify {@user.should be_authorized_for("anything","create")}
      specify {@user.should be_authorized_for("anything","edit")}
      specify {@user.should be_authorized_for("anything","update")}
      specify {@user.should be_authorized_for("anything","destroy")}
      specify {@user.should be_authorized_for("anything","show")}
      specify {@user.should be_authorized_for("anything","index")}
      specify {@user.should be_in_role("Administrator")}
      specify {@user.should be_in_role("whatever")}
    end
    context "Other roles only have their role" do
      before(:each) do
        @user = Factory.create(:user)
        @admin = Factory.create(:role, :role_name => "Landlord")
        @admin.users << @user
      end
      specify {@user.assignments.should have(1).thing}
      specify {@user.roles.should have(1).user}
      specify {@user.should_not be_in_role("Administrator")}
      specify {@user.should_not be_in_role("whatever")}
      specify {@user.should be_in_role("Landlord")}
    end
  end
end