require 'spec_helper'

shared_examples_for 'model with display order' do |model_with_display_order|
  it "must not be negative" do
    model_with_display_order.display_order = -5
    model_with_display_order.should_not be_valid
    model_with_display_order.invalid?
    model_with_display_order.errors[:display_order].should_not be_empty
  end
  
  it "must not be zero" do
    model_with_display_order.display_order = 0
    model_with_display_order.invalid?
    model_with_display_order.errors[:display_order].should_not be_empty
  end
  
  it "is allowed to be 1" do
    model_with_display_order.display_order = 1
    model_with_display_order.invalid?
    model_with_display_order.errors[:display_order].should be_empty
  end
  
  it "is allowed to be large" do
    model_with_display_order.display_order = 55000
    model_with_display_order.invalid?
    model_with_display_order.errors[:display_order].should be_empty
  end
end