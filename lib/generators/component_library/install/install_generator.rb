class ComponentLibrary::InstallGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    template "component_library.rb.erb", "config/initializers/component_library.rb"
    copy_file "layout.html.erb", "app/views/layouts/component_library.html.erb"
    copy_file "_headers.html.erb", "app/views/#{file_name}/_headers.html.erb"
  end
end
