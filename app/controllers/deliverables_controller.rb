class DeliverablesController < ApplicationController
  before_action :set_deliverable, only: [:show, :destroy]
  def new
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new
  end

  def show
    @project = @deliverable.project
    @drafts = @deliverable.drafts

  end

  def create
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new(deliverable_params)
    @project.deliverables << @deliverable
    @project.save!
    @deliverable.save!

    respond_to do |format|
        format.html { redirect_to edit_project_path(@project) }
        format.json # Follow the classic Rails flow and look for a create.json view
        format.text {render partial: 'deliverables/deliverable', locals: { deliverable: @deliverable }, formats: [:html] }
    end
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
