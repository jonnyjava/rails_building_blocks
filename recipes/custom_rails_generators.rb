stage_three do
  say_recipe 'CUSTOM RAILS GENERATORS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'lib/templates/rails/scaffold_controller/controller.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/scaffold/controller_spec.rb', repo: repo
  copy_from_repo 'lib/templates/rspec/scaffold/routing_spec.rb', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/_form.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/edit.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/index.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/new.html.slim', repo: repo
  copy_from_repo 'lib/templates/slim/scaffold/show.html.slim', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add custom generators"'
end

__END__

name: custom_rails_generators
description: "Clone rails generators from repo"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
