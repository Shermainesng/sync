class DeliverablesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_deliverable, only: %i[show destroy edit update]

  def index
    filter = params[:deliv_by] #week or month

    case filter
    when 'week'
      filtered_date = Date.today + 7
    when 'two_weeks'
      filtered_date = Date.today + 14
    when 'month'
      filtered_date = Date.today + 1.month
    end

    @deliverables = current_user.deliverables.where('due_date >= ?', Date.today).where('due_date <= ?', filtered_date).order(:due_date)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.text { render partial: 'deliverables/cards/dashboard', collection: @deliverables, as: :deliverable, formats: [:html] }
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new
  end

  def show
    @client = Organisation.find(@project.client_id)
    @deliverables = @project.deliverables.order(:due_date)
    @drafts = @deliverable.drafts.order(created_at: :desc)
    @new_draft = Draft.new
  end

  def create
    @project = Project.find(params[:project_id])
    @deliverable = Deliverable.new(deliverable_params)
    @deliverable.due_date = params[:due_date]
    @project.deliverables << @deliverable
    @project.save!
    @deliverable.save!

    @deliverables = @project.deliverables.order(:due_date)

    respond_to do |format|
      format.html { redirect_to edit_project_path(@project) }
      format.json # Follow the classic Rails flow and look for a create.json view
      format.text { render partial: 'deliverables/cards/project_details', collection: @deliverables, as: :deliverable, formats: [:html] }
    end
  end

  def destroy
    @deliverable.destroy

    respond_to do |format|
      format.html { redirect_to edit_project_path(@project) }

      # format.json # Follow the classic Rails flow and look for a create.json view
      format.text { render plain: 'ok' }
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to edit_project_path(@project) }
      format.text { render partial: 'deliverables/update', locals: { deliverable: @deliverable }, formats: [:html] }
    end
  end

  def update
    @project = Project.find(@deliverable[:project_id])

    updated = params[:deliverable]
    @deliverable.update!({ deliverable_type: updated[:deliverable_type], description: updated[:description], tag_list: updated[:tag_list].split.join(',') })

    @deliverable.due_date = params[:due_date]
    respond_to do |format|
      # format.html { redirect_to edit_project_path(@project) }
      format.json # Follow the classic Rails flow and look for a create.json view
      format.text { render partial: 'deliverables/cards/project_details', locals: { deliverable: @deliverable }, formats: [:html] }
      # format.text {render plain: 'ok' }
    end
  end

  private

  def deliverable_params
    params.require(:deliverable).permit(:deliverable_type, :description, :tag_list, :due_date)
  end

  def set_deliverable
    @deliverable = Deliverable.find(params[:id])
    @project = @deliverable.project
    redirect_to error_path if @project.user != current_user && !(@project.users.include?(current_user))
  end

  def record_not_found
    render 'pages/error', status: 404
  end
end
