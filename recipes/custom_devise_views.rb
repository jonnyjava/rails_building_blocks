stage_three do
  say_recipe 'CUSTOM DEVISE VIEWS'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/views/devise/passwords/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/registrations/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/sessions/new.html.slim', repo: repo
  copy_from_repo 'app/views/devise/shared/_links.html.slim', repo: repo
end

__END__

name: custom_devise_views
description: "Clone devise_views from repo"
author: jonnyjava.net

category: homemade
requires: [devise, extras]
run_after: [devise, extras]
