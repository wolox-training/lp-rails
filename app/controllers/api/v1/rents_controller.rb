module Api
  module V1
    class RentsController < ApiController
      def create
        from = DateTime.strptime(params[:from], '%s')
        to = DateTime.strptime(params[:to], '%s')
        rent = Rent.create(user: current_user,
                           book: Book.find(params[:book_id]),
                           from: from,
                           to: to)

        return unless rent.valid?
        # should I put this in the Model under an after_commit callback?
        render json: rent
        RentMailWorker.perform_async(rent)
        RentMailWorker.perform_at(to, rent)
      end

      def index
        rents = Rent.where(user: current_user)
        render json: rents
      end
    end
  end
end
