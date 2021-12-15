class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.newest_first.unread

    if @notifications.empty?
      respond_to do |format|
        format.html { redirect_to root_path }
        format.text { render plain: "<p>No notifications yet</p>" }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.text { render partial: 'notifications/notification', collection: @notifications, as: :notif, formats: [:html] }
      end
    end
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.mark_as_read!
  end
end
