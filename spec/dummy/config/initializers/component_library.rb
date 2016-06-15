ComponentLibrary.configure do |config|
  config.root_path = "theme_1_components"
  config.root_directory = "theme_components"
  config.application_css = "application"

  config.multiconfigure = [
    {
      root_directory: "theme_components",
      root_path: "base_components",
      application_css: "application"
    },
    {
      root_directory: "theme_components",
      root_path: "theme_1_components",
      application_css: "themed_application"
    }
  ]
end
