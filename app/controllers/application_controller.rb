class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private

  def layout_by_resource
    if devise_controller?
      "static"
    else
      "application"
    end
  end
end
