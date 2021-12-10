class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show]
  # has_scope :filter_status
  has_scope :filter_name

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
  end

  def new
    @project = Project.create!(
      user: current_user,
      name: "your project name",
      brand: "your client name",
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
      status: 'pending'
    )

    # respond_to do |format|
    #   if @project.save
    #     format.html { redirect_to edit_project_path(@project) }
    #     format.json # Follow the classic Rails flow and look for a create.json view
    #   else
    #     format.html { render 'projects/show' }
    #     format.json # Follow the classic Rails flow and look for a create.json view
    #   end
    # end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
