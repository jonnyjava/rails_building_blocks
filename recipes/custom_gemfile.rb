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

add_gem 'bower-rails'
add_gem 'devise'
add_gem 'draper'
add_gem 'kaminari'
add_gem 'rails-observers'
add_gem 'ransack'
add_gem 'simple_form'
add_gem 'slim-rails'

## test gems
add_gem 'rspec-rails', group: [:development, :test]
add_gem 'factory_girl_rails', group: [:development, :test]
add_gem 'faker', group: [:development, :test]
add_gem 'byebug', group: [:development, :test]
add_gem 'shoulda-matchers', group: [:development, :test], require: false
add_gem 'database_cleaner', group: [:test]
add_gem 'fuubar', group: [:test]

add_gem 'puma', group: :development
add_gem 'quiet_assets', group: :development
add_gem 'web-console', '~> 2.0', group: :development
add_gem 'spring', group: :development
add_gem 'better_errors', group: :development
add_gem 'binding_of_caller', group: :development
add_gem 'spring-commands-rspec', group: :development

## deploy
add_gem 'capistrano', group: :development
add_gem 'capistrano-linked-files', group: :development
add_gem 'capistrano-passenger', group: :development
add_gem 'capistrano-rails', group: :development
add_gem 'capistrano-rvm', group: :development

## quality gems
add_gem 'rubocop', '~> 0.43.0', group: :development, require: false
add_gem 'rubocop-rspec', group: :development
add_gem 'bullet', group: :development
add_gem 'traceroute', group: :development, git: 'git://github.com/distributedlife/traceroute'
add_gem 'rack-mini-profiler', group: :development, require: false
add_gem 'rubycritic', group: :development, require: false
add_gem 'scss_lint', group: :development, require: false

## Database Adapter
gsub_file 'Gemfile', /gem 'sqlite3'\n/, '' unless prefer :database, 'sqlite'
gsub_file 'Gemfile', /gem 'pg'.*/, ''
gsub_file 'Gemfile', /gem 'mysql2'.*/, ''
add_gem 'mysql2', '~> 0.4.2'

## Gems from a defaults file or added interactively
gems.each do |g|
  add_gem(*g)
end

## Git
git :add => '-A' if prefer :git, true
git :commit => '-qm "rails_apps_composer: Gemfile"' if prefer :git, true

### CREATE DATABASE ###
stage_two do
  say_wizard "recipe stage two"
  say_wizard "configuring database"
      mysql_username = prefs[:mysql_username] || ask_wizard("Username for MySQL? (leave blank to use the app name)")
      gsub_file "config/database.yml", /username: .*/, "username: #{mysql_username}"
      mysql_password = prefs[:mysql_password] || ask_wizard("Password for MySQL user #{mysql_username}?")
      gsub_file "config/database.yml", /password: [a-z 0-9]*/i, "password: #{mysql_password}"
      say_wizard "set config/database.yml for username/password #{mysql_username}/#{mysql_password}"
      gsub_file "config/database.yml", /database: myapp_development/, "database: #{app_name}_development"
      gsub_file "config/database.yml", /database: myapp_test/,        "database: #{app_name}_test"
      gsub_file "config/database.yml", /database: myapp_production/,  "database: #{app_name}_production"
    run 'bundle exec rake db:drop'
    run 'bundle exec rake db:create:all'
    ## Git
    git :add => '-A' if prefer :git, true
    git :commit => '-qm "rails_apps_composer: create database"' if prefer :git, true
end

__END__

name: custom_gemfile
description: "Add only the gems we need."
author: jonnyjava.net

requires: [gemset]
run_after: [gemset]
category: homemade
