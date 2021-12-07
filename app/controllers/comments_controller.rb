class CommentsController < ApplicationController
  def new
    @draft = draft.find(params[:draft_id])
    @comment = Comment.new
  end

  def create
    @draft = Draft.find(params[:draft_id])
    @comment = Comment.new(comment_params)
    @draft.comments << @comment
    @draft.save!
    @comment.save!
    raise

    respond_to do |format|
      format.html { redirect_to draft_path(@draft) }
      format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render partial: 'comments/comment', locals: { comment: @comment }, formats: [:html] }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
