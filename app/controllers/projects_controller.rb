class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  # has_scope :filter_status
  has_scope :filter_name
  has_scope :status

  def index
    @projects = apply_scopes(Project).all
    respond_to do |format|
      # format.json {render json: { status: "ok" } }
      # format.text {render plain: "ok"}

      format.html { redirect_to root_path }
      format.text { render partial: 'projects/project', collection: @projects, as: :project, formats: [:html] }
    end
  end

  def show
    @deliverables = @project.deliverables.order(:due_date)
    @deliverables_by_date_hash = @deliverables.group_by { |deliverable| deliverable.due_date}
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
    @project = Project.find(params[:id])
    @deliverables = @project.deliverables.order(:due_date)
    @deliverable = Deliverable.new
  end

  def update
    new = params[:project]
    @project.update!(
      brand: new[:brand],
      name: new[:name],
      project_end: "#{new["project_end(1i)"]}-#{new["project_end(2i)"]}-#{new["project_end(3i)"]}",
      description: new[:description],
      status: 'saved'
    )
  end

  def sent
    @project = Project.find(params[:project_id])
    @project.status = "pending"
    @project.save!
    respond_to do |format|
      format.html { redirect_to root_path }
      # format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render plain: "ok" }
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

  def confirm
    @project = Project.find(params[:project_id])
    @project.status = "ongoing"
    @project.save!
    ProjectStatus.with(project: @project, action: "confirmed", user: current_user).deliver(@project.user)

    redirect_to('/test')
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

end
