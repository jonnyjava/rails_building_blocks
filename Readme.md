# Welcome to Rails Building Blocks

## How to use this
- create a new gemset called `app_composer`
- `gem install rails_apps_composer`
- `gem install rubyzip`

In your project directory execute this commands :

- If needed: `rm my_app_composer.rb`
- If needed: `rm -rf my_awesome_project`
- This command will create the genertor script depending on your answers: `rails_apps_composer template my_app_composer.rb -d rails_building_blocks/material_backoffice_cookbook.yaml -l rails_building_blocks/recipes/`
- Generate the app! `rails new my_awesome_project -m my_app_composer.rb`

## TODO
- create custm views generators and add the corresponding recipe
- wizard to include or not recipes for MATERIAL_UI
- pundit generators
- include policy generators in scaffold flow
