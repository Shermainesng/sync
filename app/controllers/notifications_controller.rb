class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications

      respond_to do |format|
      # format.json {render json: { status: "ok" } }
      # format.text {render plain: "ok"}

      format.html { redirect_to root_path }
      format.text { render partial: 'notifications/notification', collection: @notifications, as: :notif, formats: [:html] }

    end
  end
end
