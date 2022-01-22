class RolesController < ApplicationController
   before_action :set_role, only: [:update]

  def update
    # selected = request.raw_post()
    @new_role_input = request.body
    @role_type = ""
    @new_role_input == 0 ? @role_type = 'admin' : @role_type = 'collaborator'
    @role.update!({
      name: @role_type
    })
    # redirect_to edit_project_path()
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end
end
