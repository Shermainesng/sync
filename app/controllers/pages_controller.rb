class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    date = Date.today + 7
    @deliverables = current_user.deliverables.where("due_date <= ?", date).order(:due_date)
    @all = current_user.projects
    @ongoing = @all.where(status: "ongoing")
    @notifications = current_user.notifications
  end

  def test
    @projects = Project.where(user: User.find(15))

  end

end
