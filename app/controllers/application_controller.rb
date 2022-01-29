class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :organisation_id, :token, :role_token])
  end

  def default_url_options
    { host: ENV["https://www.syncnergy.live/"] || "localhost:3000" }
  end

  def after_sign_in_path_for(resource)
    add_project_and_role
  end

  def after_sign_up_path_for(resource)
    add_project_and_role
  end

  def add_project_and_role
    if params[:token].present? && params[:role_token].present?
      @project = Project.find_by(token: params[:token])
      @role = Role.find_by(role_token: params[:role_token])

      if !(@project.nil?) && !(@role.nil?)
        @project.users << current_user if !(@project.users.include?(current_user))
        @proj_user = ProjectUser.find_by(user_id: current_user, project_id: @project)
        @proj_user.role = @role
        @proj_user.save!
        show_project_path(@project)
      end
    else
      root_path
    end
  end
end
