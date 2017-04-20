stage_two do
  if which("rvm")
     say_wizard "RECIPE CREATING PROJECT-SPECIFIC RVM GEMSET AND .RVMRC"
     # using the rvm Ruby API, see:
     # http://blog.thefrontiergroup.com.au/2010/12/a-brief-introduction-to-the-rvm-ruby-api/
     # https://rvm.io/integration/passenger

    # say_wizard "creating bundle configuration file"
      create_file '.gemrc'
      append_to_file '.gemrc' do
        'install: --no-rdoc --no-ri'
        'update:  --no-rdoc --no-ri'
      end

     if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
       begin
         gems_path = ENV['MY_RUBY_HOME'].split(/@/)[0].sub(/rubies/,'gems')
         ENV['GEM_PATH'] = "#{gems_path}:#{gems_path}@global"
         require 'rvm'
         RVM.use_from_path! File.dirname(File.dirname(__FILE__))
       rescue LoadError
         raise "RVM gem is currently unavailable."
       end
     end
     say_wizard "creating RVM gemset '#{app_name}'"
     RVM.gemset_create app_name
     say_wizard "switching to gemset '#{app_name}'"
     # RVM.gemset_use! requires rvm version 1.11.3.5 or newer
     rvm_spec =
       if Gem::Specification.respond_to?(:find_by_name)
         Gem::Specification.find_by_name("rvm")
       else
         Gem.source_index.find_name("rvm").last
       end
       unless rvm_spec.version > Gem::Version.create('1.11.3.4')
         say_wizard "rvm gem version: #{rvm_spec.version}"
         raise "Please update rvm gem to 1.11.3.5 or newer"
       end
     begin
      say_wizard "**************SELECTING GEMSET CALLED #{app_name}*******************"
        RVM.gemset_use! app_name
        say_wizard "**************INSTALLING BUNDLER*******************"
        run "gem install bundler"
     rescue => e
       say_wizard "rvm failure: unable to use gemset #{app_name}, reason: #{e}"
       raise
     end
     if File.exist?('.ruby-version')
       say_wizard ".ruby-version file already exists"
     else
       create_file '.ruby-version', "#{RUBY_VERSION}\n"
     end
     if File.exist?('.ruby-gemset')
       say_wizard ".ruby-gemset file already exists"
     else
       create_file '.ruby-gemset', "#{app_name}\n"
     end
   else
     say_wizard "WARNING! RVM does not appear to be available."
   end
end
__END__

name: gemset_creator
description: "Creates and use a specific gemset for the project"
author: jonnyjava.net

category: homemade
requires: [gems]
run_after: [extras, gems]
