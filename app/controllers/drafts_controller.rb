class DraftsController < ApplicationController
  # def index
  #   @deliverable = Deliverable.find(params[:deliverable_id])
  #   @drafts = @deliverable.drafts
  # end

  def new
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new
  end

  def show
    @draft = Draft.find(params[:id])
    @deliverable = @draft.deliverable
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

end
