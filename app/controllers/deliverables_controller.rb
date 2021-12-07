class DeliverablesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new
  end

  def create
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new(deliverable_params)
    @project.deliverables << @deliverable
    @project.save!
    @deliverable.save!

    respond_to do |format|
      if @deliverable.save
        format.html { redirect_to edit_project_path(@project) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render 'projects/show' }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
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
end
