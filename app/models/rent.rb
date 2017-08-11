class Rent < ApplicationRecord
  validates :book, :user, :from, :to, presence: true
  belongs_to :book
  belongs_to :user
end
