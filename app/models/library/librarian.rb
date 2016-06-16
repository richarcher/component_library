module Library
  class Librarian

    def initialize(files, configuration, title=nil)
      @files = files
      @rootDirectory = configuration[:root_directory]
      @rootPath = configuration[:root_path]
      @title = title
    end

    def components
      @files.map{ |file| Component.new(file, @rootDirectory, @rootPath) }
    end

    def title
      @title || ""
    end

  end
end