FactoryGirl.define do
  factory :event do
    sequence(:name)        {|n| "Event #{n}"}
    sequence(:description) {|n| "This is descritption"}
  end
end