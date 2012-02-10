require 'spec_helper'

describe Person do
  context "basic validations" do
    before(:each) do
      @person = Person.new
    end
    context "must not be empty" do
      before(:each) do
        @person.should_not be_valid
      end
      specify {@person.errors[:email].should_not be_empty}
      specify {@person.errors[:first_name].should_not be_empty}
      specify {@person.errors[:last_name].should_not be_empty}
      specify {@person.errors[:city].should_not be_empty}
      specify {@person.errors[:postal_code].should_not be_empty}
      specify {@person.errors[:country].should_not be_empty}
    end
    context "Countries must be in a valid list" do
      it "allows any country from Person::COUNTRIES" do
        Person::COUNTRIES.each do |c|
          @person.country = c
          @person.should_not be_valid
          @person.errors[:country].should be_empty
        end
      end
      it "rejects any countries not in Person::COUNTRIES" do
        @person.country = "INVALID"
        
        @person.should_not be_valid
        @person.errors[:country].should_not be_empty
      end
    end
    context "Provinces must be in the valid list for a country" do
      it "allows province country combinations that are set up" do
        Person::COUNTRIES.each do |c|
          Person::PROVINCES[c].each do |p|
            @person.country = c
            @person.province_or_state = p
            @person.should_not be_valid
            @person.errors[:country].should be_empty
            @person.errors[:province_or_state].should be_empty
          end
        end 
      end
      it "rejects invalid provinces " do
        @person.province_or_state = "INVALID"
        @person.should_not be_valid
        @person.errors[:province_or_state].should_not be_empty
      end
      it "rejects provinces that do not belong to a country" do
        if Person::COUNTRIES.size > 1 then
          @person.country = Person::COUNTRIES[0]
          @person.province_or_state = Person::PROVINCES[Person::COUNTRIES[1]][0]
          @person.should_not be_valid
          @person.errors[:province_or_state].should_not be_empty
        end
      end
    end
    context "emails must be valid emails " do
      it "rejects invalid emails" do
        @person.email = 'INVALID'
        @person.should_not be_valid
        @person.errors[:email].should_not be_empty
      end
      it "allows valid emails" do
        ['someone@example.com','someone2@example.com', 'someone.2@example.com','someone_2@example.com','someone-2@example.com'].each do |eml|
          @person.email = eml
          @person.should_not be_valid
          @person.errors[:email].should be_empty
        end
      end
    end
  end
end