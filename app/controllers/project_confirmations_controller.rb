class ProjectConfirmationsController < ApplicationController
  def create
    @user = current_user
    @project = params[:project]
    @subject = Project.find(@project).name
    @client_email = email_params[:client_email]
    @client_role = email_params[:role]
    @user_role = create_role

    @client_email.split(',').each do |email|
      ConfirmationMailer.with(client_email: email.strip,
                              email_subject: @subject,
                              email_body: email_params[:email_body],
                              user: @user,
                              project: @project,
                              role: @user_role
                              )
                        .send_project
                        .deliver_now!
    end
    redirect_to edit_project_path(@project)
  end

  private

  def email_params
    params.permit(:email_body, :client_email, :role)
  end

  def create_role
    if @client_role == 'admin'
      @role = Role.create!(
        name: 'admin',
      )
    elsif @client_role == 'collaborator'
      @role = Role.create!(
        name: 'collaborator',
      )
    else
      return
    end
  end
end
