require 'rails_helper'

describe User, type: :model do
  it { validate_presence_of(:first_name) }
  it { validate_presence_of(:last_name) }
  it { validate_presence_of(:email) }
  it { validate_presence_of(:password) }

  subject(:user) { create(:user) }

  it 'has a valid factory' do
    is_expected.to be_valid
  end
end
