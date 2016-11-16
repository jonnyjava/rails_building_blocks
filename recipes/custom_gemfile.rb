say_wizard "---------------BUILDING MY OWN GEMFILE----------------------"
stage_two do
  remove_file 'Gemfile'
  copy_from_repo 'Gemfile', repo: 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
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
    run 'rails db:drop'
    run 'rails db:create:all'
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
