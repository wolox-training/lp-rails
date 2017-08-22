module Api
  module V1
    class BookSuggestionsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # rubocop:disable Metrics/AbcSize
      def create
        book_suggestion = BookSuggestion.create!(editorial: params[:editorial],
                                                 price: params[:price],
                                                 author: params[:author],
                                                 title: params[:title],
                                                 link: params[:link],
                                                 publisher: params[:publisher],
                                                 year: params[:year],
                                                 user: user)
        render json: book_suggestion
      end
      # rubocop:enable Metrics/AbcSize

      private

      def user
        User.find(params[:user_id])
      end
    end
  end
end
