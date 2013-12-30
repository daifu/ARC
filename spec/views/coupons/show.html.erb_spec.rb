require 'spec_helper'

describe "coupons/show" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Coupon))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
