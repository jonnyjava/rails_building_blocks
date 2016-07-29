require 'rubygems'
require 'zip'

stage_three do
  say_recipe 'DOWNLOADS FONTS FOR MATERIALIZE THEME'
  repo = 'https://raw.githubusercontent.com/jonnyjava/rails_building_blocks/master/'
  copy_from_repo 'app/assets/fonts.zip', repo: repo

  Zip::File.open('app/assets/fonts.zip') do |zip_file|
    zip_file.each do |entry|
      zip_file.extract(entry, "app/assets/#{entry}") { true }
    end
  end
  remove_file 'app/assets/fonts.zip'
end

__END__

name: materialize_fonts_zip_downloader
description: "Downloads and uncompress font zipfile for materialize theme"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
