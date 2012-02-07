require 'spec_helper'

describe "Leases" do
  
  context "unverified user" do
    describe "GET /leases" do
      it "redirects when not signed in" do
        get leases_path
        response.status.should be(302)
      end
    end
  end
  context "sign in first as administrative user" do
    before(:each) do
      @admin = Factory.create(:role, :role_name => "Administrator")
      @user = Factory.create(:user)
      @assignment = Factory.create(:assignment, :user => @user, :role => @admin)
      visit "/users/sign_in"
      fill_in("user_email", with: @user.email )
      fill_in("user_password", with: @user.password)
      click_button("Sign in")
    end
    
    describe "GET /leases" do
      it "redirects when not signed in" do
        get leases_path
        response.status.should be(302)
      end
    end
  end
end
