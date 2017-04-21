### CREATE DATABASE ###
stage_two do
  say_wizard "---------------REWRITING DATABASE.YML----------------------"
  remove_file 'config/database.yml'
  create_file 'config/database.yml' do <<-EOF
default: &default
  adapter: mysql2
  encoding: utf8
  username: <%= ENV['DB_USERNAME'] %>
  password: <%= ENV['DB_PASSWORD'] %>

development:
  <<: *default
  database: #{app_name}_development

test:
  <<: *default
  database: #{app_name}_test

staging:
  <<: *default
  database: #{app_name}_staging

production:
  <<: *default
  database: #{app_name}_production
  EOF
  end

  say_wizard "---------------CREATING LOCAL_ENV----------------------"
  mysql_username = prefs[:mysql_username] || ask_wizard("Username for MySQL? (leave blank to use the app name)")
  mysql_password = prefs[:mysql_password] || ask_wizard("Password for MySQL user #{mysql_username}?")
  create_file 'config/local_env.yml' do <<-EOF
DB_PASSWORD: '#{mysql_password}'
DB_USERNAME: '#{mysql_username}'
  EOF
  end

  ## Git
  git :add => '-A' if prefer :git, true
  git :commit => '-qm "rails_apps_composer: create database"' if prefer :git, true
end

__END__

name: custom_seeds
description: "Clone seeds from repo"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
