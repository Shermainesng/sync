class Api::V1::ProjectsController < ActionController::Base
  has_scope :filter_name
  has_scope :status

  def index
    @projects = apply_scopes(Project).all

    render json: @projects
  end
end
