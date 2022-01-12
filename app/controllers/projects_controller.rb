class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :nested_project, only: [:sent, :confirm]
  skip_before_action :authenticate_user!, only: [ :sign_up, :show ]

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
    if params[:token].present?
      if user_signed_in?
        @project = Project.find_by(token: params[:token])
        @project.users << current_user if !(@project.users.include?(current_user))
      else
        redirect_to new_user_session_path(token: params[:token]) and return
      end
    else
      redirect_to new_user_session_path if !(user_signed_in?) and return
    end

    if @project.user == current_user || @project.users == current_user
      @deliverables = @project.deliverables.order(:due_date)
      @deliverables_by_date_hash = @deliverables.group_by { |deliverable| deliverable.due_date}
    else
      redirect_to home_path
    end
  end

  def sign_up
    redirect_to new_user_registration_path(token: params[:token])
  end

  def new
    @project = Project.create!(
      user: current_user,
      name: "",
      project_end: Date.today,
      status: 'saved'
    )

    redirect_to edit_project_path(@project)
  end

  def edit
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
    redirect_to edit_project_path(params[:id])
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
    @project.status = "pending"
    @project.save!
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

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def nested_project
    @project = Project.find(params[:project_id])
  end

end
