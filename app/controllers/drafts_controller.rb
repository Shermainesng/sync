class DraftsController < ApplicationController
  def new
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new
  end

  def show
    @draft = Draft.find(params[:id])
    @comment = Comment.new
    @comments = @draft.comments
  end

  def create
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new(draft_params)
    @draft.deliverable = @deliverable
    if @draft.save
      redirect_to deliverable_draft_path(@deliverable, @draft), notice: "Your draft has been uploaded."
    else
      render "new"
    end
  end

  private
  def draft_params
    params.require(:draft).permit(:attachment, :description)
  end
end
