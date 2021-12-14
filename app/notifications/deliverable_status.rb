# To deliver this notification:
#
# ProjectNotification.with(post: @post).deliver_later(current_user)
# ProjectNotification.with(post: @post).deliver(current_user)

class DeliverableStatus < Noticed::Base
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
  param :deliverable, :action, :user

  # Define helper methods to make rendering easier.

  def message
      "#{params[:action]} #{deliverable_type}"
  end

  def deliverable_type
    params[:deliverable].deliverable_type
  end

  def user
    params[:user]
  end

  def url
    deliverable_path(params[:deliverable])
  end
end
