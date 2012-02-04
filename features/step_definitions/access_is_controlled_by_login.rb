
include Devise::TestHelpers

Given /^the following salutations$/ do |salutation_data|
  # table is a Cucumber::Ast::Table
  Salutation.create!(salutation_data.hashes)
end

Given /^the following people$/ do |people_data|
  # table is a Cucumber::Ast::Table 
  Person.create!(people_data.hashes.collect do |phash| 
    phash[:salutation] = Salutation.find_by_salutation(phash[:salutation])
    phash 
    end)
end

Given /^I log in as (\w+) who has the role (\w+)$/ do |user_name, role_name|
  r = Role.create!(role_name: role_name, description: 'tester', active: true)
  u = User.create!(email: "#{user_name}@drogar.com", password: 'tester', password_confirm: 'tester')
  r.users << u
  r.save
  visit "/users/sign_in"
  fill_in("user_email", with: "#{user_name}@drogar.com" )
  fill_in("user_password", with: "tester")
  click_button("Sign in")
end

Then /^I should get an OK response as I visit the following pages$/  do |pages|
  # table is a Cucumber::Ast::Table
  pages.hashes.each do |to_visit|
    visit url_for(:controller => to_visit[:data], :action => to_visit[:page])
    page.should have_content(to_visit[:has_text])
  end
end