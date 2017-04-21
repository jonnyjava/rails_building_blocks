# CHANGELOG
## 1.1.1 - 21 April 2017
- override database.yml using local_env variables
- update readme with latest rails gem
- move boilerplate customization where they belong to be executed at the end
- launch bundle after creating a custom gemset
- remove useless files and recipes
- remove traceroute from gemfile because is not mantained anymore

## 1.1.0 - 20 April 2017
- update rubocop version in gemfile
- fix missing bundler gem installation in a newly created gemset
- fix missing user_decorator_spec download removing it because is useless
- fix and improve material helpers
- clean css from useless rules or comments
- refactor devise views with new form helpers
- introduce FactoryGirl syntax methods
- fix missing application_policy file
- add basic user locale file
-
## 1.0.2 - 2 December 2016
- fix I18n_translations.yml generator to be able to generate a controller alone
- complete request_spec generator adding new and create method
- remove useless flash message
- add authorization to controller generation
- remove render from error_controller methods

## 1.0.1 - November 25, 2016
- Add simplecov gem in gemfile recipe

## 1.0.0 - November 25, 2016

First stable release! It contains:
- A `micro_core` recipe to reduce the number of dependencies with rails_composer_recipes
- A `custom_application_controller` recipe to override application_controller
- A `custom_application_initializer` recipe to override application.rb
- A `custom_db_management` recipe specific for MySql
- A `custom_devise` recipe to:
  - customize devise install and user
  - run migrations
  - run seeds
  - run pundit generator
  - run user scaffolds
  - override user model
- A `custom_gemfile` recipe to copy a new gemfile
- A `customize_boilerplate` recipe to cupy custom versions of these file categories:
  - initializers
  - routes
  - locales
  - generators
  - validators
  - gitignore
  - quality gems configs
  - spec helpers and support
  - factories
  - seeds
  - user stuff
  - dashboard
  - errors
  - devise mails
- A `gemset` recipe to create a RVM gemset
And 3 recipes specific for CRM archetype
- `material_elements` UX stuff
- `materialize_fonts_zip_downloader` Fonts
- `materialize_material_zip_downloader` Vendor theme
