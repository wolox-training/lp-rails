FactoryGirl.define do
  factory :rent do
    from { Faker::Time.zone.between(2.days.ago, Time.zone.today) }
    to { Faker::Time.zone.between(Time.zone.today, 2.days.after) }
  end
end
