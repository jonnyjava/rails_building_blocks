stage_three do
  say_recipe 'MATERIAL THEME COMPONENTS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'

  # HELPERS
  copy_from_repo 'app/helpers/application_helper.rb', repo: repo
  copy_from_repo 'app/helpers/form_fields_config_helper.rb', repo: repo
  copy_from_repo 'app/helpers/material_carrierwave_components_helper.rb', repo: repo
  copy_from_repo 'app/helpers/material_components_helper.rb', repo: repo
  copy_from_repo 'app/helpers/material_form_components_helper.rb', repo: repo

  # LOCALES
  copy_from_repo 'config/locales/materialize_ui_es.yml', repo: repo

  # DEVISE
  copy_from_repo 'app/views/devise/confirmations/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/passwords/edit.html.slim', repo: repo
  copy_from_repo 'app/views/devise/passwords/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/registrations/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/sessions/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/shared/_links.html.slim', repo: repo

  # KAMINARI
  copy_from_repo 'app/views/kaminari/_first_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_gap.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_last_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_next_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_paginator.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_prev_page.html.slim', repo: repo

  # BOOTSTRAP INPUTS
  copy_from_repo 'app/inputs/material_checkbox_input.rb', repo: repo
  copy_from_repo 'app/inputs/material_radio_buttons_input.rb', repo: repo

  # GENERATORS
  copy_from_repo 'lib/generators/rails/frontend_extras/templates/filters.rb', repo: repo
  copy_from_repo 'lib/generators/rails/frontend_extras/frontend_extras_generator.rb', repo: repo

  # LAYOUTS
  copy_from_repo 'app/views/layouts/_admin_menu.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_container.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/error_layout.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_filter_layout.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_main_layout.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_menu_panel.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/application.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/devise.html.slim', repo: repo
  remove_file'app/views/layouts/_nav_links_for_auth.html.erb'
  remove_file'app/views/layouts/_navigation_links.html.erb'
  remove_file'app/views/layouts/application.html.erb'

  # SHARED
  copy_from_repo 'app/views/shared/_attachment_errors.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_delete_attachment.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_profile.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_submit_form.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_upload_attachment.html.slim', repo: repo

  # ASSETS
  copy_from_repo 'app/assets/javascripts/application.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_alerts.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_charts.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_inputmask.js', repo: repo
  copy_from_repo 'app/assets/javascripts/datepicker-es.js', repo: repo
  copy_from_repo 'app/assets/javascripts/filter_cleaner.js', repo: repo
  copy_from_repo 'app/assets/javascripts/shared.js.coffee', repo: repo
  copy_from_repo 'app/assets/javascripts/status_toggler.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/charts.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/flot-charts/bar-chart.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/flot-charts/curved-line-chart.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/flot-charts/dynamic-chart.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/flot-charts/line-chart.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/flot-charts/pie-chart.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/functions.js', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/theme.js', repo: repo
  copy_from_repo 'app/assets/stylesheets/application.scss', repo: repo
  copy_from_repo 'app/assets/stylesheets/corporate-skin.scss', repo: repo
  copy_from_repo 'app/assets/stylesheets/material_ui/theme.scss', repo: repo
  remove_file 'app/assets/stylesheets/application.css'

  # ERRORS
  remove_file 'public/401.html'
  remove_file 'public/404.html'
  remove_file 'public/422.html'
  remove_file 'public/500.html'
  copy_from_repo 'public/401.html.slim', repo: repo
  copy_from_repo 'public/404.html.slim', repo: repo
  copy_from_repo 'public/422.html.slim', repo: repo
  copy_from_repo 'public/500.html.slim', repo: repo
  copy_from_repo 'app/assets/images/errors/401.png', repo: repo
  copy_from_repo 'app/assets/images/errors/404.png', repo: repo
  copy_from_repo 'app/assets/images/errors/422.png', repo: repo
  copy_from_repo 'app/assets/images/errors/500.png', repo: repo

  # DEFAULT IMAGES
  copy_from_repo 'app/assets/images/logo.png', repo: repo
  copy_from_repo 'app/assets/images/theme/profile-menu.png', repo: repo
  copy_from_repo 'app/assets/images/theme/profile-pics/demo.jpg', repo: repo

  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: material components"'
end

__END__

name: material_elements
description: "Copy from repo all material files"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]

