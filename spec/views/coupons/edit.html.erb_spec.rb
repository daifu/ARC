require 'spec_helper'

describe "coupons/edit" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Coupon))
  end

  it "renders the edit coupon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coupons_path(@coupon), :method => "post" do
    end
  end
end
