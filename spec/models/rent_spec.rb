require 'rails_helper'

describe Rent, type: :model do
  it { validate_presence_of(:book_id) }
  it { validate_presence_of(:user_id) }
  it { validate_presence_of(:from) }
  it { validate_presence_of(:to) }

  let(:user) { create(:user) }
  let(:book) { create(:book) }

  subject(:rent) { create(:rent, user: user, book: book) }

  it 'has a valid factory' do
    is_expected.to be_valid
  end
end
