# To deliver this notification:
#
# ProjectNotification.with(post: @post).deliver_later(current_user)
# ProjectNotification.with(post: @post).deliver(current_user)

class ProjectStatus < Noticed::Base
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
  param :project, :action, :user

  # Define helper methods to make rendering easier.

  def message
    # t(".message")
    "#{params[:action]} #{project.name}"
  end

  def project
    params[:project]
  end

  def user
    params[:user]
  end

  def url
    project_path(params[:project])
  end
end
