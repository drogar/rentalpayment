require 'spec_helper'

describe Right do
  context "basic validations" do
    before(:each) do
      @right = Right.new
    end
    context "must not be empty" do
      before(:each) do
        @right.should_not be_valid
      end
      specify {@right.errors[:resource].should_not be_empty}
      specify {@right.errors[:operation].should_not be_empty}
    end
    context "Operations must be in the valid list" do
      it "should allow rights in OPERATIONS_MAPPINGS" do
         Right::OPERATIONS_MAPPINGS.values.each do |o|
           @right.operation = o
           @right.should_not be_valid
           @right.errors[:operation].should be_empty
         end
      end
      it "should reject rights not in the OPERATIONS_MAPPINGS" do
        @right.operation = "INVALID OP MAPPING"
        @right.should_not be_valid
        @right.errors[:operation].should_not be_empty
      end
    end
  end
end
