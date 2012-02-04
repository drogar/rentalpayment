Feature: Access is controlled by login

  We have to have administrative users who can do anything anywhere. They should
  always have access to the screens in the application.
  
  Other users will be controlled by the particular role(s) they have and the data they access

Background:
   Given the following salutations
    | salutation | language | display_order |
    | Mr. | en | 1 |
    | Ms. | en | 2 |
  And the following people
    | email | first_name | last_name | city | province_or_state| country | postal_code | salutation |
    | a@a.junk | a | b | city | Alberta | Canada | X0X0X0 | Mr. |
    | b@b.junk | b | c | city | Alberta | Canada | Y0Y0Y0 | Ms. |
    
  Scenario: Admin user page visits
    Given I log in as anyone who has the role Administrator
  
    Then I should get an OK response as I visit the following pages
      | data | page | has_text |
      | people | index | a@a.junk |
      | people | new | New |
      | property_types | new | New |
      | property_types | index | Listing |
    