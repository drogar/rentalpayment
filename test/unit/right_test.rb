require 'test_helper'

class RightTest < ActiveSupport::TestCase
   test "Right attrs must not be empty" do
     right = Right.new
     assert right.invalid?
     assert right.errors[:resource].any?
     assert right.errors[:operation].any?

   end

   test "Operations must be in valid list" do
     right = Right.new
     Right::OPERATIONS_MAPPINGS.values.each do |o|
       right.operation = o
       assert right.invalid?
       assert right.errors[:operation].empty?
     end
  end

  test "Invalid Operation should be rejected" do  
     right = Right.new  
     right.operation = 'INVALID NAME FOR COUNTRY'
     assert right.invalid?
     assert right.errors[:operation].any?
   end

end
