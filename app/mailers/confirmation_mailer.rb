class ConfirmationMailer < ApplicationMailer
  def send_project
    @user = params[:user]
    @client_email = params[:client_email]
    @email_subject = params[:email_subject]
    @email_body = params[:email_body]

    mail(to: @client_email, subject: @email_subject)
  end
end
