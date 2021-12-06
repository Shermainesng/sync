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

  def destroy
    @deliverable = Deliverable.find(params[:id])
    @deliverable.destroy
    redirect_to project_path(@deliverable.project)
  end

  private
  def deliverable_params
    params.require(:deliverable).permit(:type, :due_date, :description)
  end
end
