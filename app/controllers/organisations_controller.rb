class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @org = Organisation.new()
  end

  def create
    @org = Organisation.create!(org_params)
    redirect_to new_user_registration_path
  end

  private

  def org_params
    params.require(:organisation).permit(:name)
  end

end
