say_wizard "---------------BUILDING MY OWN GEMFILE----------------------"
stage_two do
  remove_file 'Gemfile'
  copy_from_repo 'Gemfile', repo: 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
end

## Git
git :add => '-A' if prefer :git, true
git :commit => '-qm "rails_apps_composer: Gemfile"' if prefer :git, true

__END__

name: custom_gemfile
description: "Add only the gems we need."
author: jonnyjava.net

requires: [gemset]
run_after: [gemset]
category: homemade
