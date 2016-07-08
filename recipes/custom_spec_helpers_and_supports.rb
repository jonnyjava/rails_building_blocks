stage_three do
  say_recipe 'CUSTOM SPEC HELPERS AND SUPPORT'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'spec/rails_helper.rb', repo: repo
  copy_from_repo 'spec/support/controller_macros.rb', repo: repo
  copy_from_repo 'spec/support/database_cleaner.rb', repo: repo
  copy_from_repo 'spec/support/request_macros.rb', repo: repo
  remove_file 'spec/support/helpers'
  remove_file 'spec/features'
  remove_file 'spec/support/capybara.rb'
  remove_file 'spec/support/devise.rb'
  remove_file 'spec/support/factory_girl.rb'
  remove_file 'spec/support/helpers.rb'
end

__END__

name: custom_spec_helprs_and_supports
description: "Clone spec helpers and supports from repo"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
