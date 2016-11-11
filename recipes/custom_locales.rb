stage_three do
  say_recipe 'CUSTOM LOCALES'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'config/locales/default_es.yml', repo: repo
  copy_from_repo 'config/locales/devise.en.yml', repo: repo
  copy_from_repo 'config/locales/devise.es.yml', repo: repo
  copy_from_repo 'config/locales/simple_form.en.yml', repo: repo
  copy_from_repo 'config/locales/simple_form.es.yml', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add locales"'
end
__END__

name: custom_locales
description: "Clone locales from repo"
author: jonnyjava.net

category: homemade
requires: []
run_after: [setup, extras]
