# Preview all emails at http://localhost:3000/rails/mailers/rent_mailer
class RentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rent_mailer/expired_rent_notification
  def expired_rent_notification
    RentMailerMailer.expired_rent_notification
  end

end
