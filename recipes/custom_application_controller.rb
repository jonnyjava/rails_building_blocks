stage_three do
  say_recipe 'OVERRIDE APPLICATION_CONTROLLER.RB'

remove_file "app/controllers/application_controller.rb"
create_file 'app/controllers/application_controller.rb' do <<-EOF
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'Access denied.'
    redirect_to user_path(current_user)
  end

  def after_sign_in_path_for(_resource)
    dashboard_index_path
  end

  def configure_permitted_parameters
    allowed_keys = [:name, :first_surname, :second_surname, :use_of_cookies]
    devise_parameter_sanitizer.permit(:sign_up, keys: allowed_keys)
  end
end
EOF
end

end

__END__

name: custom_application_controller
description: "override application_controller.rb"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
