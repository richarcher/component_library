require "component_library/engine"

module ComponentLibrary
  class << self
    mattr_accessor :root_directory, :root_path, :application_css
    self.root_directory = "component"
    self.root_path = "components"
    self.application_css = "application"
  end

  def self.setup(&block)
    yield self
  end

  def self.stylesheet_path
    '_component_library/library'
  end

  def self.javascript_path
    '_component_library/library'
  end
end
