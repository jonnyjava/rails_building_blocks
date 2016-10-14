stage_three do
  say_recipe 'CUSTOM ASSETS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/assets/javascripts/application.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_alerts.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_charts.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_inputmask.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_menu_toggler.js', repo: repo
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
  copy_from_repo 'app/assets/stylesheets/application.scss', repo: repo
  copy_from_repo 'app/assets/stylesheets/corporate-skin.scss', repo: repo
  copy_from_repo 'app/assets/stylesheets/material_ui/theme.scss', repo: repo
  remove_file 'app/assets/stylesheets/application.css'
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add assets"'
end

__END__

name: custom_assets
description: "Clone assets from repo"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]

