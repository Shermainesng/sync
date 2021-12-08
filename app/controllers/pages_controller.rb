class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = current_user.projects
    #filter deliverables by default--> in the next week
    date = Date.today + 7
    @deliverables = current_user.deliverables.where("due_date <= ?", date).order(:due_date)
  end
end
