class Mailer < ActionMailer::Base
  RECIPIENTS = ["kuzniarp@gmail.com"]

  def contact_form(sender, title, message)
    subject    "#{title} (formularz na stronie)"
    recipients RECIPIENTS
    from       sender
    sent_on    Time.now
    body       :message => message
  end
end
