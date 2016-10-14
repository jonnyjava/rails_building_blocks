stage_three do
  say_recipe 'CUSTOM APPLICATION HELPER'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/validators/date_range_validator.rb', repo: repo
  ### GIT ###
  git :add => '. -A'
  git :commit => '-qm "rails_apps_composer: add validators"'
end

__END__

name: custom_validators
description: "Clone validators"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
