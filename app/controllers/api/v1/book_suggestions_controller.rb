module Api
  module V1
    class BookSuggestionsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        book_suggestion = BookSuggestion.new(book_suggestions_params)
        error_invalid_params && return unless book_suggestion.valid?
        book_suggestion.save
        render json: book_suggestion, status: :created
      end

      def new
        @book_suggestion = BookSuggestion.new
      end

      private

      def book_suggestions_params
        params.fetch(:book_suggestion, {}).permit(
          :editorial,
          :price,
          :author,
          :title,
          :link,
          :publisher,
          :year,
          :user_id
        )
      end

      def error_invalid_params
        render_error('Invalid parameters', :unprocessable_entity)
      end

      def render_error(error_message, status)
        render json: { error: error_message }, status: status
      end
    end
  end
end
