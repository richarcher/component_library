module Library
  class Component
    def initialize(file, rootDirectory)
      @file = file
      @rootDirectory = rootDirectory
    end

    def raw
      File.open(@file).read
    end

    def render
      parseFile(@file, 'views')
    end

    def paths
      parseLinks(@file, @rootDirectory)
    end

    private

    def parseFile(file, trim)
      fileArray = preparePath(file,trim)
      fileArray[-1] = parseName(file)
      fileArray.join('/')
    end

    def parseName(file)
      file.split('/').last[1..-1]
    end

    def parseLinks(file, trim)
      response = []
      fileArray = preparePath(file, trim)
      while fileArray.length > 0 do
        response.unshift prepareHash(fileArray)
      end
      h = {path: ".", name: "components"}
      response.unshift h
    end

    def preparePath(file, trim)
      fileArray = file.split('/')
      fileArray.shift( fileArray.index(trim) + 1 )
      fileArray
    end

    def prepareHash(fileArray)

      {path: fileArray.join('/'), name: fileArray.pop}
    end
  end
end