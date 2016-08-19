say_wizard "---------------BUILDING MY OWN GEMFILE----------------------"
insert_into_file('Gemfile', "ruby '#{RUBY_VERSION}'\n", :before => /^ *gem 'rails'/, :force => false)
gsub_file 'Gemfile', /gem 'sdoc',\s+'~> 0.4.0',\s+group: :doc/, ''
gsub_file 'Gemfile', /gem 'byebug'/, ''
gsub_file 'Gemfile', /gem 'spring'/, ''
gsub_file 'Gemfile', /gem 'web-console',\s+'~> 2.0'/, ''
gsub_file 'Gemfile', /gem 'web-console'/, ''
gsub_file 'Gemfile', /group :development, :test do/, ''
gsub_file 'Gemfile', /group :development do/, ''
gsub_file 'Gemfile', /end/, ''
gsub_file 'Gemfile', /, platform: :mri/, ''
gsub_file 'Gemfile', /# .*/, ''

gsub_file 'Gemfile', /^$\n/, ''
gsub_file 'Gemfile', /gem 'spring-watcher-listen',\s+'~> 2.0.0'/, ''
gsub_file 'Gemfile', /gem 'listen',\s+'~> 3.0.5'/, ''

add_gem 'rspec-rails', group: [:development, :test]
add_gem 'factory_girl_rails', group: [:development, :test]
add_gem 'faker', group: [:development, :test]
add_gem 'byebug', group: [:development, :test]
add_gem 'shoulda-matchers', group: [:development, :test], require: false

add_gem 'database_cleaner', group: [:test]
add_gem 'fuubar', group: [:test]

add_gem 'bower-rails'
add_gem 'devise'
add_gem 'draper'
add_gem 'kaminari'
add_gem 'rails-observers'
add_gem 'ransack'
add_gem 'simple_form'
add_gem 'slim-rails'

add_gem 'puma', group: :development
add_gem 'quiet_assets', group: :development
add_gem 'web-console', '~> 2.0', group: :development
add_gem 'spring', group: :development
add_gem 'better_errors', group: :development
add_gem 'binding_of_caller', group: :development
add_gem 'spring-commands-rspec', group: :development
add_gem 'rubocop', group: :development, require: false
add_gem 'capistrano', group: :development
add_gem 'capistrano-linked-files', group: :development
add_gem 'capistrano-passenger', group: :development
add_gem 'capistrano-rails', group: :development
add_gem 'capistrano-rvm', group: :development

## Database Adapter
gsub_file 'Gemfile', /gem 'sqlite3'\n/, '' unless prefer :database, 'sqlite'
gsub_file 'Gemfile', /gem 'pg'.*/, ''
gsub_file 'Gemfile', /gem 'mysql2'.*/, ''
add_gem 'mysql2', '~> 0.4.2'

## Gems from a defaults file or added interactively
gems.each do |g|
  add_gem(*g)
end

##add_gem 'guard', '>= 2.2.2', group: :development, require: false
##add_gem 'guard-livereload', group: :development, require: false, git: 'https://github.com/guard/guard-livereload'
##add_gem 'rack-livereload', git: 'https://github.com/johnbintz/rack-livereload', group: :development
add_gem 'rb-fsevent', group: :development, require: false

## Git
git :add => '-A' if prefer :git, true
git :commit => '-qm "rails_apps_composer: Gemfile"' if prefer :git, true

### CREATE DATABASE ###
stage_two do
  say_wizard "recipe stage two"
  say_wizard "configuring database"
    if prefer :database, 'mysql'
      mysql_username = prefs[:mysql_username] || ask_wizard("Username for MySQL? (leave blank to use the app name)")
      if mysql_username.blank?
        gsub_file "config/database.yml", /username: .*/, "username: #{app_name}"
      else
        gsub_file "config/database.yml", /username: .*/, "username: #{mysql_username}"
        mysql_password = prefs[:mysql_password] || ask_wizard("Password for MySQL user #{mysql_username}?")
        gsub_file "config/database.yml", /password:/, "password: #{mysql_password}"
        say_wizard "set config/database.yml for username/password #{mysql_username}/#{mysql_password}"
      end
      gsub_file "config/database.yml", /database: myapp_development/, "database: #{app_name}_development"
      gsub_file "config/database.yml", /database: myapp_test/,        "database: #{app_name}_test"
      gsub_file "config/database.yml", /database: myapp_production/,  "database: #{app_name}_production"
    end
    unless prefer :database, 'sqlite'
        run 'bundle exec rake db:drop'
    end
    run 'bundle exec rake db:create:all'
    ## Git
    git :add => '-A' if prefer :git, true
    git :commit => '-qm "rails_apps_composer: create database"' if prefer :git, true
end

### GENERATORS ###
stage_two do
  say_wizard "recipe stage two"
  say_wizard "running generators"
  ## Form Builder
  if prefer :form_builder, 'simple_form'
    case prefs[:frontend]
      when 'bootstrap3'
        say_wizard "---------------------------------------------------------------------recipe installing simple_form for use with Bootstrap"
        generate 'simple_form:install --bootstrap'
      else
        say_wizard "---------------------------------------------------------------------recipe installing simple_form"
        generate 'simple_form:install'
    end
  end
  ## Figaro Gem
  if prefer :local_env_file, 'figaro'
    run 'figaro install'
    gsub_file 'config/application.yml', /# PUSHER_.*\n/, ''
    gsub_file 'config/application.yml', /# STRIPE_.*\n/, ''
    prepend_to_file 'config/application.yml' do <<-FILE
# Add account credentials and API keys here.
# See http://railsapps.github.io/rails-environment-variables.html
# This file should be listed in .gitignore to keep your settings secret!
# Each entry sets a local environment variable.
# For example, setting:
# GMAIL_USERNAME: Your_Gmail_Username
# makes 'Your_Gmail_Username' available as ENV["GMAIL_USERNAME"]

FILE
    end
  end
  ## Foreman Gem
  if prefer :local_env_file, 'foreman'
    create_file '.env' do <<-FILE
# Add account credentials and API keys here.
# This file should be listed in .gitignore to keep your settings secret!
# Each entry sets a local environment variable.
# For example, setting:
# GMAIL_USERNAME=Your_Gmail_Username
# makes 'Your_Gmail_Username' available as ENV["GMAIL_USERNAME"]

FILE
    end
    create_file 'Procfile', "web: bundle exec rails server -p $PORT\n" if prefer :prod_webserver, 'thin'
    create_file 'Procfile', "web: bundle exec unicorn -p $PORT\n" if prefer :prod_webserver, 'unicorn'
    create_file 'Procfile', "web: bundle exec passenger start -p $PORT\n" if prefer :prod_webserver, 'passenger_standalone'
    if (prefs[:dev_webserver] != prefs[:prod_webserver])
      create_file 'Procfile.dev', "web: bundle exec rails server -p $PORT\n" if prefer :dev_webserver, 'thin'
      create_file 'Procfile.dev', "web: bundle exec unicorn -p $PORT\n" if prefer :dev_webserver, 'unicorn'
      create_file 'Procfile.dev', "web: bundle exec passenger start -p $PORT\n" if prefer :dev_webserver, 'passenger_standalone'
    end
  end
  ## Git
  git :add => '-A' if prefer :git, true
  git :commit => '-qm "rails_apps_composer: generators"' if prefer :git, true
end

__END__

name: custom_gemfile
description: "Add only the gems we need."
author: jonnyjava.net

requires: [gemset]
run_after: [gemset]
category: homemade
