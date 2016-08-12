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
- the gemfile is awkward
- Add some intelligence to views generators to choose the appropriate helper depending on the object.attribute type
- wizard to include or not recipes for MATERIAL_UI
- pundit generators
- include policy generators in scaffold flow

for the presentation

- avoid useless generators
- classic generator
- how to integrate it in a scaffold flow

- rails app generator
- create and use a default
- create a template from a default
- run a template
- write our recipes
-- the 3 stages TRICKY!
---stage four??
http://guides.rubyonrails.org/rails_application_templates.html
https://github.com/nickjj/orats