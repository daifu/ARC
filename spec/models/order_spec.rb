require 'spec_helper'

describe Order do
  before do
    @order = Order.new
    @order.stub(:event).and_return(double('event').as_null_object)
  end

  it "should save with number" do
    @order.save
    @order.number.should_not == 'C10000000'
    @order.number.should =~ /^C100[0-9]{5}$/
  end
end