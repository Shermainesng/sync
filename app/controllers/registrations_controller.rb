class RegistrationsController < Devise::RegistrationsController
  def new
    @project = Project.find_by(token: params[:token]) if params[:token]
    super
  end

  def create
    super
    if resource.save && params[:user].key?(:token)
      @project = Project.find_by(token: params[:user][:token])
    end
  end
end
