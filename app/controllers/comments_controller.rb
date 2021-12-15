class CommentsController < ApplicationController
  def new
    @draft = Draft.find(params[:draft_id])
    @comment = Comment.new
  end

  def create
    @draft = Draft.find(params[:draft_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @draft.comments << @comment
    @draft.save!

    @comment.save!

    if comment_params[:parent_id].nil?
      CommentNotification.with(comment: @comment, user: current_user, draft: @draft).deliver(@draft.user)
    else
      @parent = Comment.find(comment_params[:parent_id])
      CommentNotification.with(comment: @comment, user: current_user).deliver(@parent.user)
    end


    respond_to do |format|
      format.html { redirect_to draft_path(@draft) }
      format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render partial: 'comments/comment', locals: { comment: @comment }, formats: [:html] }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
