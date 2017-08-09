require 'rails_helper'

describe Book, type: :model do
  it { validate_presence_of(:genre) }
  it { validate_presence_of(:author) }
  it { validate_presence_of(:image) }
  it { validate_presence_of(:title) }
  it { validate_presence_of(:publisher) }
  it { validate_presence_of(:year) }

  subject(:book) do
    create(:book)
  end

  it 'has a valid factory' do
    is_expected.to be_valid
  end
end
