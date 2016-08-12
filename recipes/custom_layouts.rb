stage_three do
  say_recipe 'CUSTOM LAYOUTS VIEWS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/views/layouts/_admin_menu.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_container.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_menu_panel.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/_main_layout.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/application.html.slim', repo: repo
  copy_from_repo 'app/views/layouts/devise.html.slim', repo: repo
  remove_file'app/views/layouts/_nav_links_for_auth.html.erb'
  remove_file'app/views/layouts/_navigation_links.html.erb'
  remove_file'app/views/layouts/application.html.erb'
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add material_ui layout"'
end

__END__

name: custom_layouts
description: "Clone layouts from repo"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]
