require 'spec_helper'

describe "leases/show" do
  before(:each) do
    @lease = assign(:lease, stub_model(Lease,
      :property_id => 1,
      :person_id => 1,
      :renewal_terms => "Renewal Terms",
      :payment_amount => "9.99",
      :payment_frequency => "Payment Frequency",
      :payment_due_on => "Payment Due On",
      :damage_deposit_id => 1,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Renewal Terms/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Payment Frequency/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Payment Due On/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
