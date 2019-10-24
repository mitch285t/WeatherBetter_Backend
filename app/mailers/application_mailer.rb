class ApplicationMailer < ActionMailer::Base
  default from: 'automailer@weatherbetter.com'
  layout 'mailer'
end
