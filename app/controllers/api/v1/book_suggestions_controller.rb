module Api
  module V1
    class BookSuggestionsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # rubocop:disable Metrics/AbcSize
      def create
        book_suggestion = BookSuggestion.new(editorial: params[:editorial],
                                                 price: params[:price],
                                                 author: params[:author],
                                                 title: params[:title],
                                                 link: params[:link],
                                                 publisher: params[:publisher],
                                                 year: params[:year],
                                                 user: user)
        render_error('Invalid parameters', :unprocessable_entity) and return unless book_suggestion.valid?
        book_suggestion.save
        render json: book_suggestion, status: :created
      end
      # rubocop:enable Metrics/AbcSize

      def new
        @suggestions = BookSuggestion.all
        render template: 'api/v1/book_suggestions/new/index.html.slim'
      end

      private

      def user
        User.find_by_id(params[:user_id])
      end

      def render_error(error_message, status)
        render json: { error: error_message }, status: status
      end
    end
  end
end
