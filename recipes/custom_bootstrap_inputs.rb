stage_three do
  say_recipe 'CUSTOM MATERIAL BOOTSTRAP INPUTS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/inputs/material_checkbox_input.rb', repo: repo
  copy_from_repo 'app/inputs/material_radio_buttons_input.rb', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add custom simpleform inputs"'
end

__END__

name: custom_bootstrap_inputs
description: "Clone custom bootstrap inputs from repo"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]
