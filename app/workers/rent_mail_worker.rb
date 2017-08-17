class RentMailWorker
  include Sidekiq::Worker

  def perform(rent_id, action)
    rent = Rent.find(rent_id)
    case action
    when :new
      RentMailer.new_rent_notification(rent).deliver
    when :expired
      RentMailer.expired_rent_notification(rent).deliver
    end
  end
end
