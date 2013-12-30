require 'spec_helper'

describe "coupons/new" do
  before(:each) do
    assign(:coupon, stub_model(Coupon).as_new_record)
  end

  it "renders new coupon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => coupons_path, :method => "post" do
    end
  end
end
