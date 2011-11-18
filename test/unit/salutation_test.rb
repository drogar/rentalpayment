require 'test_helper'

class SalutationTest < ActiveSupport::TestCase
  test "Selection list of salutations" do
    assert_equal(1, Salutation.salutations_for_select.length)
    assert_equal(2, Salutation.salutations_for_select('MyString').length )
  end
end
