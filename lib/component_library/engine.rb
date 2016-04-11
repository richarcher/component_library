module ComponentLibrary
  class Engine < ::Rails::Engine
    initializer "component_library.assets.precompile" do |app|
      app.config.assets.precompile += ["#{ComponentLibrary.stylesheet_path}.css", "#{ComponentLibrary.javascript_path}.js"]
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end