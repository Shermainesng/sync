# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class ConfirmationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def send_project
    ConfirmationMailer.send_project
  end

end
