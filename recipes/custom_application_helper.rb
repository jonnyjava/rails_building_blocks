stage_three do
  say_recipe 'CUSTOM APPLICATION HELPER'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/helpers/application_helper.rb', repo: repo
end

__END__

name: custom_application_helper
description: "Clone appication helper"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
