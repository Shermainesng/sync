class RepliesController < ApplicationController
  before_action :set_comment

  def index
    # @replies = @comment.replies
    # respond_to do |format|
    #   # format.json {render json: { status: "ok" } }
    #   # format.text {render plain: "ok"}

    #   format.html { redirect_to draft_path(@comment.draft) }
    #   format.text { render partial: 'replies/reply', collection: @replies, as: :reply, formats: [:html] }
    # end
  end

  def new
    # @draft = @comment.draft

    @reply = Comment.new
    # @draft = @comment.draft

    respond_to do |format|
      # format.html { redirect_to new_comment_reply_path(@comment) }
      # format.text {render plain: "ok"}

      # format.json # Follow the classic Rails flow and look for a create.json view
      format.text {render partial: 'replies/new', formats: [:html] }
    end
  end

  def create
    @reply = Comment.create!(
      user: current_user,
      draft: @comment.draft,
      content: params[:comment][:content],
    )

    @link = Reply.new(
      sender_id: @reply.id,
      receiver_id: @comment.id
    )
    @link.save

    respond_to do |format|
      # format.json {render json: { status: "ok" } }
      # format.text {render plain: "ok"}

      format.html { redirect_to draft_path(@comment.draft) }
      format.text { render partial: 'replies/reply', locals: {reply: @reply},formats: [:html] }
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

end
