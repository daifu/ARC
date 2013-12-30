require 'spec_helper'

describe "coupons/index" do
  before(:each) do
    assign(:coupons, [
      stub_model(Coupon),
      stub_model(Coupon)
    ])
  end

  it "renders a list of coupons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
