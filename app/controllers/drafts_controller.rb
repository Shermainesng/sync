class DraftsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_draft, only: [:show]

  def new
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new
  end

  def show
    @deliverable = @draft.deliverable
    @client = Organisation.find(@deliverable.project.client_id)
    @status_color = case @draft.status
                    when "pending"
                      "btn-sync-info"
                    when "approved"
                      "btn-sync-success"
                    when "rejected"
                      "btn-sync-danger"
                    end
    @comments = @draft.comments.select { |comment| comment.parent_id.nil?}
    @comment = Comment.new
    @project = @draft.deliverable.project
    @approver = ProjectUser.find_by(user_id: current_user, project_id: @project).role.name
  end

  def create
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new(draft_params)
    @draft.deliverable = @deliverable
    @draft.user = current_user
    @draft.status = "pending"
    if @draft.save!
      redirect_to draft_path(@draft), notice: "Your draft has been uploaded."
    else
      render "new"
    end
  end

  def approve
    @draft = Draft.find(params[:draft_id])
    @draft.status = "approved"
    @draft.save!
    DraftStatus.with(draft: @draft, user: current_user, action: "approved").deliver(@draft.user)
    redirect_to draft_path(@draft)
  end

  def reject
    @draft = Draft.find(params[:draft_id])
    @draft.status = "rejected"
    @draft.save!
    DraftStatus.with(draft: @draft, user: current_user, action: "rejected").deliver(@draft.user)
    redirect_to draft_path(@draft)
  end

  private
  def draft_params
    params.require(:draft).permit(:description, {attachments: []})
  end

  def set_draft
    @draft = Draft.find(params[:id])
    @project = @draft.deliverable.project
    redirect_to error_path if @project.user != current_user || !(@project.users.include?(current_user))
  end

  def record_not_found
    render "pages/error", status: 404
  end

end
