class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('sync@admin.com', 'Sync')
  layout 'mailer'
end
