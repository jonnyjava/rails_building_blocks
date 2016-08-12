stage_three do
  say_recipe 'CUSTOM SHARED VIEWS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/views/shared/_back_to_index.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_delete.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_edit_button.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_go_to_edit.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_go_to_new.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_go_to_show.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_next_step.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_pagination.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_previous_step.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_profile.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_reset_button.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_search_button.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_show_button.html.slim', repo: repo
  copy_from_repo 'app/views/shared/_submit_form.html.slim', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add shared views"'
end

__END__

name: custom_shared_views
description: "Clone shared_views from repo"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]
