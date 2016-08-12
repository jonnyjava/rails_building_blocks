stage_three do
  say_recipe 'CUSTOM APPLICATION HELPER'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/helpers/application_helper.rb', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add application helper"'
end

__END__

name: custom_application_helper
description: "Clone appication helper"
author: jonnyjava.net

category: material_ui_theme
requires: [extras]
run_after: [extras]
