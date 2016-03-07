module Library
  class Librarian

    def initialize(files, rootDirectory, title=nil)
      @files = files
      @rootDirectory = rootDirectory
      @title = title
    end

    def components
      @files.map{ |file| Component.new(file, @rootDirectory) }
    end

    def title
      @title || ""
    end

  end
end