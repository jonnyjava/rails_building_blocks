stage_three do
  say_recipe 'CUSTOM DEVISE ROUTES'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'config/routes.rb', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add devise routes"'
end

__END__

name: custom_devise_routes
description: "Clone routes.rb"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
