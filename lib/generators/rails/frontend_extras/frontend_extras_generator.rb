class Rails::FrontendExtrasGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_view_filter_partial
    template_file = File.join("app/views/#{file_name}", '', "_filters.html.slim" )
    template 'filters.rb', template_file
  end
end
