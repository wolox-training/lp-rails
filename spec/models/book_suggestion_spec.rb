require 'rails_helper'

describe BookSuggestion, type: :model do
  it { validate_presence_of(:author) }
  it { validate_presence_of(:title) }
  it { validate_presence_of(:link) }
  it { validate_presence_of(:user) }

  subject(:book_suggestion) { create(:book_suggestion, user: create(:user)) }

  it 'has a valid factory' do
    is_expected.to be_valid
  end
end
