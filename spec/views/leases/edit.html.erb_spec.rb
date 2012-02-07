require 'spec_helper'

describe "leases/edit" do
  before(:each) do
    @lease = assign(:lease, stub_model(Lease,
      :property_id => 1,
      :person_id => 1,
      :renewal_terms => "MyString",
      :payment_amount => "9.99",
      :payment_frequency => "MyString",
      :payment_due_on => "MyString",
      :damage_deposit_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit lease form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leases_path(@lease), :method => "post" do
      assert_select "input#lease_property_id", :name => "lease[property_id]"
      assert_select "input#lease_person_id", :name => "lease[person_id]"
      assert_select "input#lease_renewal_terms", :name => "lease[renewal_terms]"
      assert_select "input#lease_payment_amount", :name => "lease[payment_amount]"
      assert_select "input#lease_payment_frequency", :name => "lease[payment_frequency]"
      assert_select "input#lease_payment_due_on", :name => "lease[payment_due_on]"
      assert_select "input#lease_damage_deposit_id", :name => "lease[damage_deposit_id]"
      assert_select "input#lease_status", :name => "lease[status]"
    end
  end
end
