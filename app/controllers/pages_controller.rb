class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home

    date = Date.today + 7
    @deliverables = current_user.deliverables.where("due_date <= ?", date).order(:due_date)
    @projects = current_user.projects.where(status: "Ongoing")

  end
end
