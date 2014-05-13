require 'spec_helper'

describe Order do
  let(:order) do
    o = FactoryGirl.create(:order)
    o.stub(:event).and_return(double('event').as_null_object)
    o
  end

  it "should save with number" do
    order.save
    order.number.should_not == 'C10000000'
    order.number.should =~ /^C100[0-9]{5}$/
  end
end