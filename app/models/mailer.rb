class Mailer < ActionMailer::Base
  RECIPIENTS = (RAILS_ENV == 'production' ? ["bogdan@dobre-maszyny.eu","marcin@dobre-maszyny.eu"] : ["kuzniarp@gmail.com"])

  def contact_form(sender, title, message, phone)
    subject    "#{title} (formularz na stronie)"
    recipients RECIPIENTS
    from       sender
    sent_on    Time.now
    body       :message => message, :phone => phone
  end
end
