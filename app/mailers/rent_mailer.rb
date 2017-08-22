class RentMailer < ActionMailer::Base
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.rent_mailer.expired_rent_notification.subject
  default from: Rails.application.secrets.mailer_user_name
  layout 'mailer'

  def new_rent_notification(rent)
    @rent = rent
    mail to: rent.user.email, subject: t(:mail_rent_title_new)
  end

  def expired_rent_notification(rent)
    @rent = rent
    mail to: rent.user.email, subject: t(:mail_rent_title_expired)
  end
end
