require 'test_helper'

class PropertyTypeTest < ActiveSupport::TestCase
  test "Property attributes must not be null" do
    ptype = PropertyType.new
    assert ptype.invalid?
    assert ptype.errors[:property_type].any?, "Type seems to be allowed to be null!"
    assert ptype.errors[:description].any?, "description seems to be allowed to be null!"
    assert ptype.errors[:display_order].any?, "display order seems to be allowed to be null!"
  end
  
  test "Display order of propertytypes required" do
    ptype = PropertyType.new
    assert ptype.invalid?
    assert ptype.errors[:display_order].any?
  end
  
  test "Display order of propertytypes must be >= 1" do
    ptype = PropertyType.new
    ptype.display_order = -5
    assert ptype.invalid?
    assert ptype.errors[:display_order].any?
    
    ptype.display_order = 0
    assert ptype.invalid?
    assert ptype.errors[:display_order].any?
    
    ptype.display_order = 1
    assert ptype.invalid?
    assert ptype.errors[:display_order].empty?
    
    ptype.display_order = 5000
    assert ptype.invalid?
    assert ptype.errors[:display_order].empty?
  end
  
end
