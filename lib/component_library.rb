require "component_library/engine"

module ComponentLibrary
  class << self
    mattr_accessor :root_directory, :root_path
    self.root_directory = "component"
    self.root_path = "components"
  end

  def self.setup(&block)
    yield self
  end
end
