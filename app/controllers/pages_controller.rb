class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing ]

  def landing
    redirect_to '/home' if user_signed_in?
  end

  def home
    @owned = current_user.projects# owned projects
    @shared = Project.all.select {|proj| proj.users.include?(current_user)}
    @all = @owned.concat(@shared)
    @ongoing = @owned.where(status: "ongoing")
    date = Date.today + 7
    deliverables = Deliverable.all.where("due_date >= ?", Date.today).where("due_date <= ?", date).order(:due_date) #array of deliverables
    @deliverables = deliverables.select{|d| d.project_status == "ongoing" }
    @notifications = current_user.notifications
  end

  def test
    @projects = Project.where(user: User.find_by(email: "testuser@gmail.com"))
  end
end
