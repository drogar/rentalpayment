require 'spec_helper'

describe PropertyType do
  context "basic validations" do
    before(:each) do
      @ptype = PropertyType.new
    end
    context "must not be empty" do
      before(:each) do
        @ptype.should_not be_valid;
      end
      specify {@ptype.errors[:property_type].should_not be_empty}
      specify {@ptype.errors[:description].should_not be_empty}
      specify {@ptype.errors[:display_order].should_not be_empty}
    end
  end
  
  context "display order range restriction" do 
    it_behaves_like 'model with display order', PropertyType.new      
  end
end