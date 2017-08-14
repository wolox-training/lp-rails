module Api
  module V1
    class RentsController < ApiController
      def create
        rent = Rent.create(user: current_user,
                           book: Book.find(params[:book_id]),
                           from: params[:from],
                           to: params[:to])
        render json: rent
      end

      def index
        rents = Rent.where(user_id: current_user.id)
        render json: rents
      end
    end
  end
end
