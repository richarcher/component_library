module ComponentLibrary
  class Engine < ::Rails::Engine
    initializer "component_library.assets.precompile" do |app|
      app.config.assets.precompile += %w(library.css library.js prism.js)
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end