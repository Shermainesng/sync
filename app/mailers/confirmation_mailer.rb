class ConfirmationMailer < ApplicationMailer
  def send_project
    @user = params[:user]
    @project = params[:project]
    @project_url = "https://www.syncnergy.live/projects/#{@project}"
    @client_email = params[:client_email]
    @email_subject = params[:email_subject]
    @email_body = params[:email_body]

    mail(to: @client_email, subject: @email_subject, body: @email_body)
  end
end
