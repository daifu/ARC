FactoryGirl.define do
  factory(:blank_order, :class => Order) do |factory|
    factory.number "C10000000"
  end

  factory(:order, :parent => :blank_order) do |factory|
    # factory.payments { |p| [p.association(:authorized_paypal_payment)] }
    factory.line_item {|li| li.association(:line_item) }
    factory.coupon {|c| c.association(:dollar_off_coupon)}
    factory.user {|u| u.association(:user)}

    factory.after(:create) do |o|
      o.save! # should recalculate the totals correctly
      o.reload
    end
  end
end