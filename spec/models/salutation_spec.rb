require 'spec_helper'

describe Salutation do
  context "basic validations" do
    before(:each) do
      @sal = Salutation.new
      
    end
    
    it "must not allow the salutation to be empty" do
      @sal.invalid?.should == true
      @sal.errors[:salutation].should_not be_empty
    end
    
    
    it "must not allow the language to be empty" do
       @sal.invalid?.should == true
       @sal.errors[:language].should_not be_empty
    end
    
    it "must not all the display order to be empty" do
      @sal.invalid?.should == true
      @sal.errors[:display_order].should_not be_empty
    end
    
    it "must not allow a language not in the valid list" do
      @sal.language = 'INVALID LANG'
      @sal.invalid?.should == true
      @sal.errors[:language].should_not be_empty
    end  
       
    it "must allow any language in the valid list" do
      Salutation::LANGUAGES.each do |l|
         @sal.language = l
         @sal.invalid?.should == true # revalidating
         @sal.errors[:language].should be_empty
      end
    end
    
    context "display order range restriction" do 
      it "must not be negative" do
        @sal.display_order = -5
        @sal.invalid?
        @sal.errors[:display_order].should_not be_empty
      end
      
      it "must not be zero" do
        @sal.display_order = 0
        @sal.invalid?
        @sal.errors[:display_order].should_not be_empty
      end
      
      it "is allowed to be 1" do
        @sal.display_order = 1
        @sal.invalid?
        @sal.errors[:display_order].should be_empty
      end
      
      it "is allowed to be large" do
        @sal.display_order = 55000
        @sal.invalid?
        @sal.errors[:display_order].should be_empty
      end
      
    end
  end
  context "Selection List of Salutations" do
    before(:each) do
      mr = Factory.create(:salutation)
      ms = Factory.create(:salutation, :salutation => 'Ms')
      mrs = Factory.create(:salutation, :salutation => 'Mrs')
      sr =  Factory.create(:salutation, :salutation => 'Sr', :language => "es")
    end
    it "should have 3 entries in the default (english) list" do
      3.should == Salutation.salutations_for_select.length
    end
    it "should have 1 entry in the Spanish (es) list" do
      1.should == Salutation.salutations_for_select('es').length
    end
    it "should have no entries in the French (fr) list" do
      0.should == Salutation.salutations_for_select('fr').length
    end
  end
  
end
