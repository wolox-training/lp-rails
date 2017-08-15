class RentMailWorker
  include Sidekiq::Worker

  def perform(rent)
    RentMailer.expired_rent_notification(rent).deliver
  end
end
