class LibraryController < ApplicationController
  layout "component_library"

  def index
    dir = Dir.glob("#{Rails.root}/app/views/#{ComponentLibrary.root_directory}/**/*.erb")
    @library = Library::Librarian.new(dir, ComponentLibrary.root_directory)
  end

  def show
    suffix = params[:format] == 'erb' ? ".erb" : "/**/*.erb"
    dir = Dir.glob("#{Rails.root}/app/views/#{ComponentLibrary.root_directory}/#{params[:path]}#{suffix}")
    @library = Library::Librarian.new(dir, ComponentLibrary.root_directory, params[:path])
    raise ActionController::RoutingError.new('Not Found') if @library.components.empty?
  end

end
