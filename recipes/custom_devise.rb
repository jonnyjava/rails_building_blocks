stage_two do
  say_wizard "--------------CUSTOMIZE DEVISE INSTALL AND USER-------------------"
  gsub_file 'config/initializers/filter_parameter_logging.rb', /:password/, ':password, :password_confirmation'
  generate 'migration AddFieldsToUsers first_surname:string second_surname:string role:integer phone:string  use_of_cookies:boolean'
  gsub_file 'app/models/user.rb', /:registerable,/, ":registerable, :confirmable,"
  generate 'migration AddConfirmableToUsers confirmation_token:string confirmed_at:datetime confirmation_sent_at:datetime unconfirmed_email:string'
  say_wizard "--------------RUNNING MIGRATIONS-------------------"
  run 'rails db:migrate'
  ### GIT ###
  git add: '-A'
  git commit: '-qm "rails_apps_composer: devise"'
end

stage_four do
  say_recipe '-------------- RUNNING SEEDS --------------'
  run 'bundle install'
  run 'rails db:seed'

  say_recipe "--------------RUNNING PUNDIT GENERATOR-------------------"
  run 'rails g pundit:install'
  say_recipe "--------------RUNNING USER SCAFFOLDS-------------------"
  run 'rails db:migrate'
  run 'rails g scaffold_controller User email first_surname name password password_confirmation phone role second_surname use_of_cookies'
  run 'rails generate policy User'
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

name: custom_devise
description: "Add Devise for authentication and customize User model"
author: jonnyjava.net

category: homemade
requires: [gems]
run_after: [gems]
