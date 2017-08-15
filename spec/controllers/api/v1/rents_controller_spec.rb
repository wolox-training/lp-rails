require 'rails_helper'
require 'shared/contexts.rb'

describe Api::V1::RentsController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the rents from a user' do
      let!(:rents) { create_list(:rent, 3, user: user, book: create(:book)) }

      before { get :index, params: { id: user.id } }

      it 'responses with the rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response.body).to eq expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'When creating a rent' do
      let!(:book) { create(:book) }
      let!(:rent) { create(:rent, user: user, book: book) }

      before { post :create, params: { id: user.id, book_id: book.id, from: rent.from, to: rent.to } }

      it 'responds with the rent json' do
        rent.id = JSON.parse(response.body)['id']
        expect(response.body).to eq RentSerializer.new(
          rent, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
