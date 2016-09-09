stage_three do
  say_recipe 'CUSTOM RUBOCOP CONFIG'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo '.rubocop.yml', repo: repo
  copy_from_repo '.scss-lint.yml', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add custom rubocop config"'
end

__END__

name: custom_rubocop_config
description: "Clone rubocop config"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
