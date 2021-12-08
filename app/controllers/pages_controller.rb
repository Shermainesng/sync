class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = current_user.projects
    @deliverables = current_user.deliverables.order(:due_date)
  end
end
