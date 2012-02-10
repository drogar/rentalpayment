require 'spec_helper'

describe PropertyType do
  context "basic validations" do
    before(:each) do
      @ptype = PropertyType.new
    end
    context "must not be empty" do
      specify {@ptype.should_not be_valid; @ptype.errors[:property_type].should_not be_empty}
      specify {@ptype.should_not be_valid; @ptype.errors[:description].should_not be_empty}
      specify {@ptype.should_not be_valid; @ptype.errors[:display_order].should_not be_empty}
    end
    context "Display order of prototypes must be >= 1" do
      it "should not allow negative" do
        @ptype.display_order = -5
        @ptype.should_not be_valid
        @ptype.errors[:display_order].should_not be_empty
      end
      it "should not allow 0" do
        @ptype.display_order = 0
        @ptype.should_not be_valid
        @ptype.errors[:display_order].should_not be_empty
      end
      it "should allow 1" do
        @ptype.display_order = 1
        @ptype.should_not be_valid
        @ptype.errors[:display_order].should be_empty
      end
      it "should allow a big number" do
        @ptype.display_order = 5678920
        @ptype.should_not be_valid
        @ptype.errors[:display_order].should be_empty
      end
    end
  end
end
        