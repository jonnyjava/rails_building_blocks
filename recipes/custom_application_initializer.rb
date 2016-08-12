stage_three do
  say_recipe 'OVERRIDE APPLICATION.RB'

remove_file "config/application.rb"
create_file 'config/application.rb' do <<-EOF
require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module #{app_name.capitalize}
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exist?(env_file)
    end

    config.generators do |generate|
      generate.assets false
      generate.decorator false
      generate.helper false
      generate.jbuilder false
      generate.view_specs false
    end
    config.autoload_paths << \"\#{Rails.root}/app/inputs\"
    config.i18n.default_locale = :es
    config.active_record.raise_in_transactional_callbacks = true
  end
end

EOF
end


end

__END__

name: custom_application_initializer
description: "override application.rb"
author: jonnyjava.net

category: homemade
requires: [extras]
run_after: [extras]
