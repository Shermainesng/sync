class ProjectsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :nested_project, only: [:sent, :confirm]
  skip_before_action :authenticate_user!, only: [:sign_up, :show]


  has_scope :filter_name
  has_scope :status

  def index
    @projects = apply_scopes(Project).all
    respond_to do |format|

      format.html { redirect_to root_path }
      format.text { render partial: 'projects/project', collection: @projects, as: :project, formats: [:html] }
    end
  end

  def show
    if params[:token].present? && params[:role_token]
      if user_signed_in?
        add_project_and_role
      else
        redirect_to new_user_session_path(token: params[:token], role_token: params[:role_token]) and return
      end
    else
      redirect_to new_user_session_path if !(user_signed_in?) and return
    end

    if @project.user == current_user || @project.users.include?(current_user)
      @deliverables = @project.deliverables.order(:due_date)
      @deliverables_by_date_hash = @deliverables.group_by { |deliverable| deliverable.due_date}
      @collaborators = @project.users
    else
      redirect_to error_path
    end
  end

  def sign_up
    redirect_to new_user_registration_path(token: params[:token], role_token: params[:role_token])
  end

  def new
    @project = Project.create!(
      user: current_user,
      name: "",
      project_end: Date.today,
      status: 'saved'
    )
    @role = Role.create!({
      name: 'admin'
    })
    @project.users << current_user
    @proj_user = ProjectUser.find_by(user_id: current_user, project_id: @project)
    @proj_user.role = @role
    @proj_user.save!

    redirect_to edit_project_path(@project)
  end

  def edit
    redirect_to error_path  if @project.user != current_user || !(@project.users.include?(current_user))
    @deliverables = @project.deliverables.order(:due_date)
    @deliverable = Deliverable.new
  end

  def update
    new = params[:project]
    @project.update!(
      name: new[:name],
      project_end: params[:project_end],
      description: new[:description],
      status: 'saved'
    )

    respond_to do |format|
      format.html { redirect_to edit_project_path(params[:id]) }
      format.text { render plain: "ok"}
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      # format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render plain: "ok" }
    end
  end

  def sent
    respond_to do |format|
      format.html { redirect_to root_path }
      # format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render plain: "ok" }
    end

  end

  def confirm
    @project.status = "ongoing"
    @project.brand_id = current_user.id
    @project.save!
    ProjectStatus.with(project: @project, action: "confirmed", user: current_user).deliver(@project.user)
    redirect_to('/test')
  end

  def add_project_and_role
    @project = Project.find_by(token: params[:token])
    @role = Role.find_by(role_token: params[:role_token])

    if !(@project.nil?) && !(@role.nil?)
      @project.users << current_user if !(@project.users.include?(current_user))
      @proj_user = ProjectUser.find_by(user_id: current_user, project_id: @project)
      @proj_user.role = @role
      @proj_user.save!
      show_project_path(@project)
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def nested_project
    @project = Project.find(params[:project_id])
  end

  def record_not_found
    render "pages/error", status: 404
  end

end
