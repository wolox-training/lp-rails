module Api
  module V1
    class BooksController < ApiController

      def index
        books = Book.all.each do |book|
          BookSerializer.new(book)
        end
        render json: books
      end

      def show
        book = BookSerializer.new(Book.find(params[:id]))
        render json: book
      end
    end
  end
end
