stage_three do
  say_recipe 'CUSTOM SEEDS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'db/seeds.rb', repo: repo
end

stage_four do
  say_recipe 'RUNNING SEEDS'
  run 'rails db:seed'
end
__END__

name: custom_seeds
description: "Clone seeds from repo"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
