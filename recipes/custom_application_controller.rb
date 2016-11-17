stage_three do
  say_recipe 'OVERRIDE APPLICATION_CONTROLLER.RB'

remove_file "app/controllers/application_controller.rb"
create_file 'app/controllers/application_controller.rb' do <<-EOF
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
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
