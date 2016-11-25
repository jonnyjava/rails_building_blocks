# CHANGELOG
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
