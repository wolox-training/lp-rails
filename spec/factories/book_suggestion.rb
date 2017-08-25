FactoryGirl.define do
  factory :book_suggestion do
    editorial { Faker::Company.name }
    price { Faker::Number.decimal }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url('book-link.com', '/book') }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1800, 2017) }
  end
end
