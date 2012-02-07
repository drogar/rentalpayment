require 'spec_helper'

describe "leases/index" do
  before(:each) do
    assign(:leases, [
      stub_model(Lease,
        :property_id => 1,
        :person_id => 2,
        :renewal_terms => "Renewal Terms",
        :payment_amount => "9.99",
        :payment_frequency => "Payment Frequency",
        :payment_due_on => "Payment Due On",
        :damage_deposit_id => 3,
        :status => "Status"
      ),
      stub_model(Lease,
        :property_id => 1,
        :person_id => 2,
        :renewal_terms => "Renewal Terms",
        :payment_amount => "9.99",
        :payment_frequency => "Payment Frequency",
        :payment_due_on => "Payment Due On",
        :damage_deposit_id => 3,
        :status => "Status"
      )
    ])
  end

  it "renders a list of leases" do
    render

    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2

    assert_select "tr>td", :text => "Renewal Terms".to_s, :count => 2

    assert_select "tr>td", :text => "9.99".to_s, :count => 2

    assert_select "tr>td", :text => "Payment Frequency".to_s, :count => 2

    assert_select "tr>td", :text => "Payment Due On".to_s, :count => 2

    assert_select "tr>td", :text => 3.to_s, :count => 2

    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
