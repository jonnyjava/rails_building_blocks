stage_three do
  say_recipe 'ADD, DELETE OR COPY CUSTOM FILES FROM REPO'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'

  # INITIALIZERS
  copy_from_repo 'config/environments/development.rb', repo: repo
  copy_from_repo 'config/initializers/devise.rb', repo: repo
  copy_from_repo 'config/initializers/draper.rb', repo: repo
  copy_from_repo 'config/initializers/rack_profiler.rb', repo: repo
  copy_from_repo 'config/initializers/simple_form.rb', repo: repo
  copy_from_repo 'config/initializers/simple_form_bootstrap.rb', repo: repo
  copy_from_repo 'config/initializers/wrap_parameters.rb', repo: repo

  # ROUTES
  copy_from_repo 'config/routes.rb', repo: repo

  # LOCALES
  copy_from_repo 'config/locales/default_es.yml', repo: repo
  copy_from_repo 'config/locales/devise.en.yml', repo: repo
  copy_from_repo 'config/locales/devise.es.yml', repo: repo
  copy_from_repo 'config/locales/simple_form.en.yml', repo: repo
  copy_from_repo 'config/locales/simple_form.es.yml', repo: repo

  # GENERATORS
  copy_from_repo 'lib/templates/rails/scaffold_controller/controller.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/scaffold/controller_spec.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/scaffold/routing_spec.rb', repo: repo
  copy_from_repo 'lib/generators/rails/policy/policy_generator.rb', repo: repo
  copy_from_repo 'lib/generators/rails/policy/templates/policy.rb', repo: repo
  copy_from_repo 'lib/generators/rails/policy/templates/policy_spec.rb', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/_form.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/edit.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/index.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/new.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/show.html.slim', repo: repo

  # VALIDATORS
  copy_from_repo 'app/validators/date_range_validator.rb', repo: repo

  # QUALITY GEMS CONFIGS
  copy_from_repo '.rubocop.yml', repo: repo
  copy_from_repo '.scss-lint.yml', repo: repo
  copy_from_repo '.reek', repo: repo
  copy_from_repo '.traceroute', repo: repo

  # SPEC HELPERS AND SUPPORT
  copy_from_repo 'spec/rails_helper.rb', repo: repo
  copy_from_repo 'spec/support/controller_macros.rb', repo: repo
  copy_from_repo 'spec/support/database_cleaner.rb', repo: repo
  copy_from_repo 'spec/support/request_macros.rb', repo: repo
  remove_file 'spec/support/helpers'
  remove_file 'spec/features'
  remove_file 'spec/support/capybara.rb'
  remove_file 'spec/support/devise.rb'
  remove_file 'spec/support/factory_girl.rb'
  remove_file 'spec/support/helpers.rb'

  # DASHBOARD
  copy_from_repo 'app/controllers/dashboard_controller.rb', repo: repo
  copy_from_repo 'app/views/dashboard/index.html.slim', repo: repo

  # ERRORS
  copy_from_repo 'app/controllers/error_controller.rb', repo: repo

  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add initializers"'
end

__END__

name: customize_boilerplate
description: "add, delete or copy custom files from repo"
author: jonnyjava.net

category: homemade
requires: [devise, extras]
run_after: [devise, extras]
