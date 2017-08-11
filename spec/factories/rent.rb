FactoryGirl.define do
  factory :rent do
    from { Faker::Date.forward }
    to { Faker::Date.forward }
  end
end
