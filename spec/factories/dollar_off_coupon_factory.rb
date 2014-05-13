FactoryGirl.define do
  factory(:dollar_off_coupon, :class => DollarOffCoupon) do |factory|
    factory.amount 10
    factory.code '10OFF'
    factory.minimum_amount 0
  end
end