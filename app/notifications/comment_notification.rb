# To deliver this notification:
#
# ProjectNotification.with(post: @post).deliver_later(current_user)
# ProjectNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database #, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # def to_database
  #   {
  #     type: self.class_name,
  #     params: params
  #   }
  # end

  # Add required params
  #
  param :comment, :user

  # Define helper methods to make rendering easier.

  def message
    # t(".message")
    "#{user.first_name} replied to your comment"
  end

  def user
    params[:user]
  end

  def comment
    params[:comment]
  end

  def url
    draft_path(comment.draft)
  end
end
