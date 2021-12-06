class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @deliverables = @project.deliverables
  end

  def new
    @project = Project.create!(
      user: current_user,
      name: "your project name",
      brand: "your client name"
    )

    redirect_to edit_project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    new = params[:project]
    @project.update!(
      brand: new[:brand],
      name: new[:name],
      project_end: new[:project_end],
      description: new[:description]
    )

    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_project_path(@project) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render 'projects/show' }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end
end
