stage_three do
  say_recipe 'CUSTOM ASSETS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/assets/javascripts/application.js', repo: repo
  copy_from_repo 'app/assets/javascripts/custom_alerts.js', repo: repo
  copy_from_repo 'app/assets/javascripts/shared.js.coffee', repo: repo
  copy_from_repo 'app/assets/javascripts/theme/functions.js', repo: repo
  copy_from_repo 'app/assets/stylesheets/application.scss', repo: repo
  copy_from_repo 'app/assets/stylesheets/material_ui/theme.scss', repo: repo
  remove_file 'app/assets/stylesheets/application.css'
end

__END__

name: custom_assets
description: "Clone assets from repo"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
