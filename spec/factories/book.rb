FactoryGirl.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url('image-host.com', '/image.png') }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1800, 2017) }
  end
end
