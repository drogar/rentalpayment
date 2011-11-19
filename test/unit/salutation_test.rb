require 'test_helper'

class SalutationTest < ActiveSupport::TestCase
  test "Selection list of salutations" do
    assert_equal(1, Salutation.salutations_for_select.length)
    assert_equal(2, Salutation.salutations_for_select('es').length )
  end
  
  test "Salutation attrs must not be empty" do
     sal = Salutation.new
     assert sal.invalid?
     assert sal.errors[:salutation].any?
     assert sal.errors[:language].any?
      assert sal.errors[:display_order].any?
  end

  test "Language must be in valid list" do
    sal = Salutation.new
    sal.language = 'INVALID LANG'
    assert sal.invalid?
    assert sal.errors[:language].any?
      
    Salutation::LANGUAGES.each do |l|
       sal.language = l
       assert sal.invalid?
       assert sal.errors[:language].empty?
    end
  end
  
  
  test "Display order of salutations must be >= 1" do
    sal = Salutation.new
    sal.display_order = -5
    assert sal.invalid?
    assert sal.errors[:display_order].any?
    
    sal.display_order = 0
    assert sal.invalid?
    assert sal.errors[:display_order].any?
    
    sal.display_order = 1
    assert sal.invalid?
    assert sal.errors[:display_order].empty?
    
    sal.display_order = 5000
    assert sal.invalid?
    assert sal.errors[:display_order].empty?
  end

  
end
