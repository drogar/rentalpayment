require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  
  test "Person attrs must not be empty" do
    person = Person.new
    assert person.invalid?
    assert person.errors[:email].any?
    assert person.errors[:first_name].any?
    assert person.errors[:last_name].any?
    assert person.errors[:city].any?
    assert person.errors[:postal_code].any?
    assert person.errors[:country].any?
  
  end
  
  test "Countries must be in valid list" do
    person = Person.new
    Person::COUNTRIES.each do |c|
      person.country = c
      assert person.invalid?
      assert person.errors[:country].empty?
    end
 end
 
 test "Invalid Country should be rejected" do  
    person = Person.new  
    person.country = 'INVALID NAME FOR COUNTRY'
    assert person.invalid?
    assert person.errors[:country].any?
  end
  
  test "Province should be in valid list" do
    person = Person.new
    Person::COUNTRIES.each do |c|
      Person::PROVINCES[c].each do |p|
        person.country = c
        person.province_or_state = p
        assert person.invalid?
        assert person.errors[:province_or_state].empty?, "#{p} not valid for #{c}: #{person.errors[:province_or_state]}"
      end
    end
  end
  
  test "Invalid province should be rejected" do
    person = Person.new
    person.province_or_state = "INVALID NAME FOR PROVINCE"
    assert person.invalid?
    assert person.errors[:province_or_state].any?
  end
  
  test "Province must be in applicable country list" do
    if Person::COUNTRIES.size > 1 then
      person = Person.new
      person.country = Person::COUNTRIES[0]
      person.province_or_state = Person::PROVINCES[Person::COUNTRIES[1]][0]
      assert person.invalid?
      assert person.errors[:province_or_state].any?, "#{person.province_or_state} no error for #{person.country}"
    end
  end
  
  
  
  test "email must be valid email" do
    person = Person.new
    person.email = 'INVALID'
    assert person.invalid?
    assert person.errors[:email].any?, '"INVALID" is invalid email'
   # person.errors[:email].
    
    ['someone@example.com','someone2@example.com', 'someone.2@example.com','someone_2@example.com','someone-2@example.com'].each do |eml|
      person.email = eml
      assert person.invalid?
      assert person.errors[:email].empty?, "#{eml} should not be an invalid email: #{person.errors[:email]}"
    end
  
  end
  
  
end
