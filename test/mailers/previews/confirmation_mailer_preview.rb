# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class ConfirmationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def send_project

    user = User.first
    ConfirmationMailer.with(client_email: @client_email,
                            email_subject: @email_subject,
                            email_body: @email_body,
                            user: user).send_project
  end

end
