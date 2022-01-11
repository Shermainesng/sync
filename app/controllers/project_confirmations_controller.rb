class ProjectConfirmationsController < ApplicationController
  def create
    @user = current_user
    @project = params[:project]
    @subject = Project.find(@project).name
    @client_email = email_params[:client_email]

    @client_email.split(',').each do |email|
      ConfirmationMailer.with(client_email: email.strip,
                              email_subject: @subject,
                              email_body: email_params[:email_body],
                              user: @user,
                              project: @project,
                              )
                        .send_project
                        .deliver_now!
    end

    redirect_to root_path
  end

  private

  def email_params
    params.permit(:email_body, :client_email)
  end
end
