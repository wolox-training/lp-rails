require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:genre)
  end
  it do
    should validate_presence_of(:author)
  end
  it do
    should validate_presence_of(:image)
  end
  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:publisher)
  end
  it do
    should validate_presence_of(:year)
  end

  subject(:book) do
    described_class.new(
      genre: genre,
      author: author,
      image: image,
      title: title,
      publisher: publisher,
      year: year
    )
  end

  let(:genre)     { Faker::Book.genre }
  let(:author)    { Faker::Book.author }
  let(:image)     { Faker::Internet.url('image-host.com', '/image.png') }
  let(:title)     { Faker::Book.title }
  let(:publisher) { Faker::Book.publisher }
  let(:year)      { Faker::Number.between(1800, 2017) }

  it 'is valid with valid parameters' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the genre is nil' do
      let(:genre) { nil }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When the author is nil' do
      let(:author) { nil }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When the image is nil' do
      let(:image) { nil }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When the title is nil' do
      let(:title) { nil }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When the publisher is nil' do
      let(:publisher) { nil }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When the year is nil' do
      let(:year) { nil }

      it do
        is_expected.not_to be_valid
      end
    end
  end
end
