require 'rubygems'
require 'zip'

stage_three do
  say_recipe 'DOWNLOADS MATERIALIZE THEME'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'vendor/assets.zip', repo: repo

  Zip::File.open('vendor/assets.zip') do |zip_file|
    zip_file.each do |entry|
      zip_file.extract(entry, "vendor/#{entry}") { true }
    end
  end
  remove_file 'vendor/assets.zip'
  remove_file 'vendor/__MACOSX'
end

__END__

name: materialize_material_zip_downloader
description: "Downloads and uncompress vendor assets zipfile for materialize theme"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
