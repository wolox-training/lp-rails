class RentMailWorker
  include Sidekiq::Worker

  def perform(rent, action)
    case action
      when :new
        RentMailWorker.new_rent_notification(rent).deliver
      when :expired
        RentMailer.expired_rent_notification(rent).deliver
    end
  end
end
