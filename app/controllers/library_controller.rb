class LibraryController < ApplicationController

  before_action :assign_variables

  layout "component_library"

  def index
    dir = Dir.glob("#{Rails.root}/app/views/#{@configuration[:root_directory]}/**/*.erb").sort

    @library = Library::Librarian.new(dir, @configuration[:root_directory])
  end

  def show
    suffix = params[:format] == 'erb' ? ".erb" : "/**/*.erb"
    dir = Dir.glob("#{Rails.root}/app/views/#{@configuration[:root_directory]}/#{params[:path]}#{suffix}").sort

    @library = Library::Librarian.new(dir, @configuration[:root_directory], params[:path])

    raise ActionController::RoutingError.new('Not Found') if @library.components.empty?
  end

  private

  def assign_variables
    @root_path = params[:root_path]
    @configuration = ComponentLibrary.configuration.for(@root_path)[0]
    @component_template = params[:view] == 'isolation' ? 'isolationpattern' : 'componentpattern'
  end

end
