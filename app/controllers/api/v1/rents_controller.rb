module Api
  module V1
    class RentsController < ApiController
      def create
        rent = Rent.create!(user: current_user,
                            book: book,
                            from: params[:from].to_datetime,
                            to: params[:to].to_datetime)

        email_work(rent)
        render json: rent
      end

      def index
        rents = Rent.where(user: current_user)
        authorize rents
        render json: rents
      end

      private

      def email_work(rent)
        RentMailWorker.perform_async(rent.id, :new)
        RentMailWorker.perform_at(rent.to, rent.id, :expired)
      end

      def book
        Book.find(params[:book_id])
      end
    end
  end
end
