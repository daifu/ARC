FactoryGirl.define do
  factory(:blank_order, :class => Order) do |factory|
    factory.sequence(:number) {|n| "C100#{n}"}
  end

  factory(:order, :parent => :blank_order) do |factory|
    factory.payments { |p| [p.association(:paypal_payment)] )
    factory.line_items {|li| [li.association(:line_item)] }

    factory.after(:create) do |o|
      o.save! # should recalculate the totals correctly
      o.reload
    end
  end
end