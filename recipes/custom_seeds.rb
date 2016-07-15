stage_three do
  say_recipe 'CUSTOM SEEDS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/d/seeds.rb', repo: repo
end

__END__

name: custom_seeds
description: "Clone seeds from repo"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
