class RentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.expired_rent_notification.subject
  #

  def new_rent_notification(rent)
    @rent = rent
    mail to: rent.user.email, subject: 'New rent created!'
  end

  def expired_rent_notification(rent)
    @rent = rent
    mail to: rent.user.email, subject: 'Your rent has expired!'
  end
end
