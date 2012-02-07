require 'spec_helper'

describe Salutation do
  describe "basic validations" do
    it "must include the language in the valid list" do
      sal = Salutation.new
      sal.language = 'INVALID LANG'
      sal.invalid?.should == true
      sal.errors[:language].any?.should == true
            
      Salutation::LANGUAGES.each do |l|
         sal.language = l
         sal.invalid?.should == true # revalidating
         sal.errors[:language].empty?.should == true
      end
    end
  end
end
