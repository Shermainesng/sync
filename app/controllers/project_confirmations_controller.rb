class ProjectConfirmationsController < ApplicationController
  def create
    @user = current_user
    @project = params[:project]
    @project_url = "https://www.syncnergy.live/projects/#{@project}"
    ConfirmationMailer.with(client_email: email_params[:client_email],
                            email_subject: email_params[:email_subject],
                            email_body: email_params[:email_body],
                            user: @user,
                            project: @project,
                            )
                      .send_project
                      .deliver_now!

    redirect_to root_path
  end

  private

  def email_params
    params.permit(:email_body, :client_email, :email_subject)
  end
end
