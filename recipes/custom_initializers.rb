stage_three do
  say_recipe 'CUSTOM INITIALIZERS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'config/initializers/devise.rb', repo: repo
  copy_from_repo 'config/initializers/draper.rb', repo: repo
  copy_from_repo 'config/initializers/simple_form.rb', repo: repo
  copy_from_repo 'config/initializers/simple_form_bootstrap.rb', repo: repo
  copy_from_repo 'config/initializers/wrap_parameters.rb', repo: repo
end

__END__

name: custom_initializers
description: "Clone initializers from repo"
author: jonnyjava.net

category: homemade
requires: [devise, extras]
run_after: [devise, extras]
