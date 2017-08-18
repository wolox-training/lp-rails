FactoryGirl.define do
  factory :rent do
    from { Faker::Date.between(2.days.ago, Date.today) }
    to { Faker::Date.between(Date.today, 2.days.after) }
  end
end
