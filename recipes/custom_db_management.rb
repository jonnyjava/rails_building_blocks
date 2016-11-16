### CREATE DATABASE ###
stage_two do
  say_wizard "---------------CONFIGURING DATABASE----------------------"
  mysql_username = prefs[:mysql_username] || ask_wizard("Username for MySQL? (leave blank to use the app name)")
  gsub_file "config/database.yml", /username: .*/, "username: #{mysql_username}"

  mysql_password = prefs[:mysql_password] || ask_wizard("Password for MySQL user #{mysql_username}?")
  gsub_file "config/database.yml", /password: [a-z 0-9]*/i, "password: #{mysql_password}"

  say_wizard "-------SET CONFIG/DATABASE.YML FOR USERNAME/PASSWORD #{mysql_username}/#{mysql_password}"

  gsub_file "config/database.yml", /database: myapp_development/, "database: #{app_name}_development"
  gsub_file "config/database.yml", /database: myapp_test/,        "database: #{app_name}_test"
  gsub_file "config/database.yml", /database: myapp_production/,  "database: #{app_name}_production"

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
