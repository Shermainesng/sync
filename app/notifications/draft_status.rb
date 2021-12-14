# To deliver this notification:
#
# ProjectNotification.with(post: @post).deliver_later(current_user)
# ProjectNotification.with(post: @post).deliver(current_user)

class DraftStatus < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database #, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  def to_database
    {
      type: self.class,
      user: params[:draft].deliverable.project.user,
      params: params
    }
  end

  # Add required params
  #
  param :draft, :action, :user

  # Define helper methods to make rendering easier.
  def message
    # t(".message")
    "#{params[:action]} draft for #{deliverable.deliverable_type} - #{deliverable.project.name}"
  end


  def deliverable
    params[:draft].deliverable
  end

  def user
    params[:user]
  end

  def url
    draft_path(params[:draft])
  end
end
