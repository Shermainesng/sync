class Api::V1::ProjectsController < ActionController::Base
  has_scope :filter_name
  has_scope :status

  def index
    @projects = apply_scopes(Project).all

    projects = []

    @projects.each do |proj|
      project = {
        name: proj.name,
        brand: proj.brand,
        description: proj.description
      }
      project.icons = []
      project.icons = proj.deliverables.map { &:deliverable_type }
      projects << project
    end

    render json: projects
  end
end
