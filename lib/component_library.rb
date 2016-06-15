require "component_library/engine"

module ComponentLibrary

  class << self
    attr_accessor :configuration
  end

  def self.setup(&block)
    puts "DEPRECATION NOTICE: configuration via .setup will be removed in future versions of the Component Library gem. Please use .configure instead."
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.configure(&block)
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.stylesheet_path
    '_component_library/library'
  end

  def self.javascript_path
    '_component_library/library'
  end

  class Configuration
    attr_accessor :root_directory
    attr_accessor :root_path
    attr_accessor :application_css

    def initialize
      @root_path = "components"
      @root_directory = "component"
      @application_css = "application"
    end
  end

end