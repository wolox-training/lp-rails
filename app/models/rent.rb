class Rent < ApplicationRecord
  validates :book_id, :user_id, :from, :to, presence: true
  belongs_to :book
  belongs_to :user
end
