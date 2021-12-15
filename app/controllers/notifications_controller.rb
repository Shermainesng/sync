class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.newest_first.unread

    respond_to do |format|
      # format.json {render json: { status: "ok" } }
      # format.text {render plain: "ok"}
      format.html { redirect_to root_path }
      format.text { render partial: 'notifications/notification', collection: @notifications, as: :notif, formats: [:html] }
    end
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.mark_as_read!
  end
end
