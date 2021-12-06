class DeliverablesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new
  end

  def create
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new(deliverable_params)
    @project.deliverable = @deliverable
    @deliverable.save!
    redirect_to project_path(@project)
  end

  private
  def deliverable_params
    params.require(:deliverable).permit(:type, :due_date, :description)
  end
end
