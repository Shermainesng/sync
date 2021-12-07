# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class ConfirmationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def send_project
    user = User.first
    ConfirmationMailer.with(client_email: 'zzz.gmail.com',
                            email_subject: 'teset',
                            email_body: 'testing',
                            user: user).send_project
  end

end
