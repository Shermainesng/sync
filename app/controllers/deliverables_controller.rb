class DeliverablesController < ApplicationController
  before_action :set_deliverable, only: [:show, :destroy]
  def index
    filter = params[:deliv_by] #week or month

    case filter
      when "week"
        filtered_date = Date.today + 7
      when "two_weeks"
        filtered_date = Date.today + 14
      when "month"
        filtered_date = Date.today + 1.month
    end

    @deliverables= current_user.deliverables.where("due_date <= ?", filtered_date).order(:due_date)

    respond_to do |format|
      # format.json {render json: { status: "ok" } }
      # format.text {render plain: "ok"}

      format.html { redirect_to root_path}
      format.text { render partial: 'deliverables/deliverable', collection: @deliverables, as: :deliverable, formats: [:html] }
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new
  end

  def show
    @project = @deliverable.project
    @deliverables = @project.deliverables
    @drafts = @deliverable.drafts
    @new_draft = Draft.new

  end

  def create
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new(deliverable_params)
    @project.deliverables << @deliverable
    @project.save!
    @deliverable.save!

    @deliverables = @project.deliverables.order(:due_date)

    respond_to do |format|
      format.html { redirect_to edit_project_path(@project) }
      format.json # Follow the classic Rails flow and look for a create.json view
      format.text { render partial: 'deliverables/deliverable', collection: @deliverables, as: :deliverable, locals: { has_link: false }, formats: [:html] }

    end
  end

  def destroy
    @deliverable = Deliverable.find(params[:id])
    @deliverable.destroy

    respond_to do |format|
      format.html { redirect_to edit_project_path(@project) }
      # format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render plain: "ok" }
    end
  end

  def edit
    @deliverable = Deliverable.find(params[:id])
    respond_to do |format|
      format.html { redirect_to edit_project_path(@project) }
      format.text {render partial: 'deliverables/update', locals: { deliverable: @deliverable }, formats: [:html]}
    end
  end

  def update
    @deliverable = Deliverable.find(params[:id])
    @project = Project.find(@deliverable[:project_id])

    updated = params[:deliverable]
    @deliverable.update!({
      deliverable_type: updated[:deliverable_type],
      due_date: "#{updated["due_date(1i)"]}-#{updated["due_date(2i)"]}-#{updated["due_date(3i)"]}",
      description: updated[:description],
      tag_list: updated[:tag_list].split.join(",")
    })

    respond_to do |format|
        # format.html { redirect_to edit_project_path(@project) }
        format.json # Follow the classic Rails flow and look for a create.json view
        format.text {render partial: 'deliverables/deliverable', locals: { deliverable: @deliverable }, formats: [:html]}
        # format.text {render plain: 'ok' }
    end
  end

  private
  def deliverable_params
    params.require(:deliverable).permit(:deliverable_type, :due_date, :description, :tag_list)
  end

  def set_deliverable
    @deliverable = Deliverable.find(params[:id])
  end
end
