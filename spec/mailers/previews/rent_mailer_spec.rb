require 'rails_helper'

describe RentMailer, type: :mailer do
  describe 'When calling the mailer' do
    let!(:book) { create(:book) }
    let(:rent) { create(:rent, user: user, book: book) }
    let(:user) { create(:user) }
    let(:mail) { described_class.new_rent_notification(rent).deliver_now }

    it 'generates the mail subject' do
      expect(mail.subject).to eq('New rent created!')
    end
    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end
    it 'renders the sender email' do
      expect(mail.from).to eq(['no-reply@training.wolox.com.ar'])
    end
    it 'assigns user@name' do
      expect(mail.body.encoded).to match(/user.first_name/)
    end
    it 'assigns rent/book@title' do
      expect(mail.body.encoded).to match(/book.title/)
    end
  end
end
