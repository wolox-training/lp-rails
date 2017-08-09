FactoryGirl.define do
  factory :book do
    genre Faker::Book.genre
    author Faker::Book.author
    image Faker::Internet.url('image-host.com', '/image.png')
    title Faker::Book.title
    publisher Faker::Book.publisher
    year Faker::Number.between(1800, 2017)
  end

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password
  end

  factory :rent do
    from Faker::Date.forward
    to Faker::Date.forward
  end
end
