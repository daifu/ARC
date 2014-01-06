require 'spec_helper'

describe "line_items/index" do
  before(:each) do
    assign(:line_items, [
      stub_model(LineItem, :quantity => 1, :event => stub_model(Event, :name => 'test')),
      stub_model(LineItem, :quantity => 2, :event => stub_model(Event, :name => 'test'))
    ])
  end

  it "renders a list of line_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
