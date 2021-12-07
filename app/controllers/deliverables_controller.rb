class DeliverablesController < ApplicationController
  before_action :set_deliverable, only: [:show, :destroy]
  def new
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new
  end

  def show
    respond_to do |format|
      format.html { redirect_to deliverable_path(@deliverable) }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new(deliverable_params)
    @project.deliverables << @deliverable
    @project.save!
    @deliverable.save!

    redirect_to deliverable_path(@deliverable)
  end

  def destroy
    @deliverable = Deliverable.find(params[:id])
    @deliverable.destroy
    redirect_to project_path(@deliverable.project)
  end

  private
  def deliverable_params
    params.require(:deliverable).permit(:deliverable_type, :due_date, :description)
  end

  def set_deliverable
    @deliverable = Deliverable.find(params[:id])
  end
end
