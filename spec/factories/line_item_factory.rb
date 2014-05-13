FactoryGirl.define do

  factory(:line_item) do |factory|
    factory.quantity  { rand(10) + 1 }
    factory.amount    { BigDecimal.new("#{rand(200)}.#{rand(99)}") }
    factory.cost      { BigDecimal.new("#{rand(10)}.#{rand(99)}") }
    factory.quantity_used { rand(10) }
  end

end