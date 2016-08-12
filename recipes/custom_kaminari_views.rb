stage_three do
  say_recipe 'CUSTOM KAMINARI VIEWS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/views/kaminari/_first_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_gap.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_last_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_next_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_page.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_paginator.html.slim', repo: repo
  copy_from_repo 'app/views/kaminari/_prev_page.html.slim', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add kaminari views"'
end

__END__

name: custom_kaminari_views
description: "Clone kaminari_views from repo"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]
