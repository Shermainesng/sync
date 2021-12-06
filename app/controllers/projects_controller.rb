class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @deliverables = @project.deliverables
  end

  def new
    @project = Project.new
  end
end
