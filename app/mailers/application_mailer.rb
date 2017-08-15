class ApplicationMailer < ActionMailer::Base
  default from: "noreply@#{Rails.application.secrets.mailer_domain}"
  layout 'mailer'
end
