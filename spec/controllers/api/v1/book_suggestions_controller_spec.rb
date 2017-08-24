require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a book suggestion' do
      let(:user) { create(:user) }
      let(:book_suggestion) { create(:book_suggestion, user: user) }

      before do
        post :create, params: { book_suggestion:
                                    {
                                      user_id: user.id,
                                      editorial: book_suggestion.editorial,
                                      price: book_suggestion.price,
                                      author: book_suggestion.author,
                                      title: book_suggestion.title,
                                      link: book_suggestion.link,
                                      publisher: book_suggestion.publisher,
                                      year: book_suggestion.year
                                    } }
      end

      it 'responds with the book suggestion json' do
        expect(response.body).to eq BookSuggestionSerializer.new(
          book_suggestion, root: false
        ).to_json
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid user rent' do
      before do
        post :create, params: { title: nil }
      end

      it 'doesn\'t create a new rent' do
        expect { post :create, params: { title: nil } }.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
