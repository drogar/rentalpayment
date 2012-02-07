# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lease do
    property_id 1
    person_id 1
    lease_start "2012-02-05"
    lease_end "2012-02-05"
    renewal_terms "MyString"
    payment_amount "9.99"
    payment_frequency "MyString"
    payment_due_on "MyString"
    damage_deposit_id 1
    status "MyString"
  end
end
