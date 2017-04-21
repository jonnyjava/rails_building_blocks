stage_three do
  say_recipe 'ADD, DELETE OR COPY CUSTOM FILES FROM REPO'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'

  # INITIALIZERS
  copy_from_repo 'config/environments/development.rb', repo: repo
  copy_from_repo 'config/environments/test.rb', repo: repo
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
  copy_from_repo 'lib/generators/rails/frontend_extras/templates/i18n_translations.rb', repo: repo
  copy_from_repo 'lib/generators/rails/policy/policy_generator.rb', repo: repo
  copy_from_repo 'lib/generators/rails/policy/templates/policy.rb', repo: repo
  copy_from_repo 'lib/generators/rails/policy/templates/policy_spec.rb', repo: repo
  copy_from_repo 'lib/templates/rails/scaffold_controller/controller.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/integration/request_spec.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/scaffold/controller_spec.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/scaffold/routing_spec.rb', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/_form.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/edit.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/index.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/new.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/show.html.slim', repo: repo
  remove_file 'lib/templates/erb/scaffold/_form.html.erb'
  remove_dir 'lib/templates/erb'

  # VALIDATORS
  copy_from_repo 'app/validators/date_range_validator.rb', repo: repo

  # GITIGNORE
  copy_from_repo '.gitignore', repo: repo

  # QUALITY GEMS CONFIGS
  copy_from_repo '.reek', repo: repo
  copy_from_repo '.rspec', repo: repo
  copy_from_repo '.rubocop.yml', repo: repo
  copy_from_repo '.scss-lint.yml', repo: repo
  copy_from_repo '.traceroute', repo: repo

  # SPEC HELPERS AND SUPPORT
  copy_from_repo 'spec/rails_helper.rb', repo: repo
  copy_from_repo 'spec/support/controller_macros.rb', repo: repo
  copy_from_repo 'spec/support/database_cleaner.rb', repo: repo
  copy_from_repo 'spec/support/pundit_matcher.rb', repo: repo
  copy_from_repo 'spec/support/request_macros.rb', repo: repo
  remove_file 'spec/support/helpers'
  remove_file 'spec/features'
  remove_file 'spec/support/capybara.rb'
  remove_file 'spec/support/devise.rb'
  remove_file 'spec/support/factory_girl.rb'
  remove_file 'spec/support/helpers.rb'

  # FACTORIES
  remove_file 'spec/factories/users.rb'
  copy_from_repo 'spec/factories/users.rb', repo: repo

  # SEEDS
  copy_from_repo 'db/seeds.rb', repo: repo

  # USER STUFF
  copy_from_repo 'spec/models/user_spec.rb', repo: repo

  # DASHBOARD
  copy_from_repo 'app/controllers/dashboard_controller.rb', repo: repo
  copy_from_repo 'app/views/dashboard/index.html.slim', repo: repo

  # ERRORS
  copy_from_repo 'app/controllers/errors_controller.rb', repo: repo

  # DEVISE MAILS
  copy_from_repo 'app/assets/images/mails/header.png', repo: repo
  copy_from_repo 'app/views/layouts/mailer.html.slim', repo: repo
  remove_file 'app/views/layouts/mailer.html.erb'
  remove_file 'app/views/layouts/mailer.text.erb'
  copy_from_repo 'app/views/devise/mailer/confirmation_instructions.html.slim', repo: repo
  copy_from_repo 'app/views/devise/mailer/confirmation_instructions.text.erb', repo: repo
  copy_from_repo 'app/views/devise/mailer/password_change.html.slim', repo: repo
  copy_from_repo 'app/views/devise/mailer/password_change.text.erb', repo: repo
  copy_from_repo 'app/views/devise/mailer/reset_password_instructions.html.slim', repo: repo
  copy_from_repo 'app/views/devise/mailer/reset_password_instructions.text.erb', repo: repo

  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add initializers"'
end

stage_four do
  #say_recipe '-------------- RUNNING SEEDS --------------'
  run 'rails db:migrate'
  run 'rails db:seed'

  say_recipe "--------------RUNNING PUNDIT GENERATOR-------------------"
  run 'rails g pundit:install'
  say_recipe "--------------RUNNING USER SCAFFOLDS-------------------"
  run 'rails g scaffold_controller User email first_surname name password password_confirmation phone role second_surname use_of_cookies'
  remove_file 'config/locales/users_es.yml'
  copy_from_repo 'config/locales/users_es.yml', repo: 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  say_recipe "--------------OVERRIDING USER MODEL-------------------"
  remove_file 'app/models/user.rb'
  create_file 'app/models/user.rb' do <<-EOF
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, :first_surname, presence: true
  validates_acceptance_of :use_of_cookies, accept: true

  enum role: { admin: 0 }
end
  EOF
  end
  ### GIT ###
  git add: '-A'
  git commit: '-qm "rails_apps_composer: user scaffolds"'
end

__END__

name: customize_boilerplate
description: "add, delete or copy custom files from repo"
author: jonnyjava.net

category: homemade
requires: [devise, extras, custom_db_management]
run_after: [devise, extras, custom_devise, custom_db_management]
