require 'spec_helper'

describe Coupon do
  before do
    @coupon = Coupon.new
  end

  subject {@coupon}

  it { should respond_to(:code) }
  it { should respond_to(:expired_at) }

  it "should set expired_at after initialization" do
    @coupon.expired_at.should_not be_nil
  end
end
