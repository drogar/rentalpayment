require 'spec_helper'

describe Salutation do
  context "basic validations" do
    before(:each) do
      @sal = Salutation.new   
    end
    context "required fields must not be empty" do
      before(:each) do
        @sal.should_not be_valid
      end
      specify {@sal.errors[:salutation].should_not be_empty}  
      specify {@sal.errors[:language].should_not be_empty}
      specify {@sal.errors[:display_order].should_not be_empty}
    end
    context "Languages must be in the valid list" do
      it "must not allow a language not in the valid list" do
        @sal.language = 'INVALID LANG'
        @sal.should_not be_valid
        @sal.errors[:language].should_not be_empty
      end  
        
      it "must allow any language in the valid list" do
        Salutation::LANGUAGES.each do |l|
           @sal.language = l
           @sal.should_not be_valid
           @sal.errors[:language].should be_empty
        end
      end
    end
  end
  
  context "display order range restriction" do 
    it_behaves_like 'model with display order', Salutation.new      
  end

  context "Selection List of Salutations" do
    before(:each) do
      mr = Factory.create(:salutation)
      ms = Factory.create(:salutation, :salutation => 'Ms')
      mrs = Factory.create(:salutation, :salutation => 'Mrs')
      sr =  Factory.create(:salutation, :salutation => 'Sr', :language => "es")
    end
    it "should have 3 entries in the default (english) list" do
      Salutation.salutations_for_select.should have(3).things
    end
    it "should have 1 entry in the Spanish (es) list" do
      Salutation.salutations_for_select('es').should have(1).thing
    end
    it "should have no entries in the French (fr) list" do
      Salutation.salutations_for_select('fr').should have(0).things
    end
  end
  
end
