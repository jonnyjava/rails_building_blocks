# Welcome to Rails Building Blocks

This is an application of [Rails App Composer](https://github.com/RailsApps/rails_apps_composer/wiki/tutorial-rails-apps-composer)

## How to use this
- Create a new gemset called `app_composer`
- `gem install rails -v 5.0.0.1 --no-ri --no-rdoc`
- `gem install rails_apps_composer`
- `gem install rubyzip`
- Clone the project and modify the recipes as you prefer. Read the tutorial linked above to know how to do it.

In your project directory execute this commands :

- If needed: `rm my_app_composer.rb`
- If needed: `rm -rf my_awesome_project`
- This command will create the rails template script: `rails_apps_composer template my_app_composer.rb -d rails_building_blocks/material_backoffice_cookbook.yaml -l rails_building_blocks/recipes/`
- Generate the app! `rails new my_awesome_project -m my_app_composer.rb`

This file `material_backoffice_cookbook.yaml` contains the basic sets of answers for the composer wizard. Change it only if you know what you are doing!

## TODO
See the project kanban
