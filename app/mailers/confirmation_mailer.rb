class ConfirmationMailer < ApplicationMailer
  def send_project
    @user = params[:user]
    @project = params[:project]
    @token = Project.find(@project).token
    # @project_url = "https://www.syncnergy.live/projects/#{@project}"
    @project_url = ""
    @client_email = params[:client_email]
    @email_subject = params[:email_subject]
    @email_body = params[:email_body]

    if (User.find_by(email: @client_email)).nil?
      @project_url = "localhost:3000/projects/#{@project}/#{@token}/sign_up"
      mail(
        to: @client_email,
        subject: @email_subject
      )
    else
      @project_url = "localhost:3000/projects/#{@project}/#{@token}"
      mail(
        to: @client_email,
        subject: @email_subject
      )
    end
  end
end
