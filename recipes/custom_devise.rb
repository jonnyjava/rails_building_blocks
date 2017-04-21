stage_two do
  say_wizard "--------------CUSTOMIZE DEVISE INSTALL AND USER-------------------"
  gsub_file 'config/initializers/filter_parameter_logging.rb', /:password/, ':password, :password_confirmation'
  generate 'migration AddFieldsToUsers first_surname:string second_surname:string role:integer phone:string  use_of_cookies:boolean'
  gsub_file 'app/models/user.rb', /:registerable,/, ":registerable, :confirmable,"
  generate 'migration AddConfirmableToUsers confirmation_token:string confirmed_at:datetime confirmation_sent_at:datetime unconfirmed_email:string'
  ### GIT ###
  git add: '-A'
  git commit: '-qm "rails_apps_composer: customize devise"'
end

__END__

name: custom_devise
description: "Add Devise for authentication and customize User model"
author: jonnyjava.net

category: homemade
requires: [gems, devise]
run_after: [devise]
