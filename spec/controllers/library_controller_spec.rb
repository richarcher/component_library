require "rails_helper"

RSpec.describe ComponentLibrary::LibraryController, :type => :controller do

  let(:request) { double }

  before :each do
    @path = '/controller_path'
    @configuration = [{:root_directory => 'theme_components'}]
    allow_any_instance_of(ComponentLibrary::Configuration).to receive(:for).and_return(@configuration)
  end

  describe "before_action" do

    def get_index(root_path, view=nil)
      get :index, root_path: root_path, view: view
    end

    it('assigns @root_path') do
      get_index 'foo'
      expect(assigns(:root_path)).to eq 'foo'
    end

    it('assigns @configuration') do
      get_index @path
      expect(assigns(:configuration)).to eq @configuration[0]
    end

    it "assigns @component_template" do
      get_index @path
      expect(assigns(:component_template)).to eq 'componentpattern'
    end

    it "assigns @component_template with isolation pattern if paramter is provided" do
      get_index @path, 'isolation'
      expect(assigns(:component_template)).to eq 'isolationpattern'
    end
  end

  describe "GET #index" do


    def get_index(root_path)
      get :index, root_path: root_path
    end

    it "responds successfully with an HTTP 200 status code" do
      get_index @path
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get_index @path
      expect(response).to render_template("index")
    end

    it "assigns @library" do
      get_index @path
      expect(assigns(:library)).to_not be_nil
    end

    it "assigns all component files to @library.components" do
      get_index @path
      expect(assigns(:library).components.length).to eq 3
    end

  end

  describe "GET #show" do
    def get_show(root_path, url, format=nil)
      @url = url
      get :show, root_path: root_path, path: url, format: format
    end

    it "responds successfully with an HTTP 200 status code" do
      get_show(@path, '_buttons.html', 'erb')
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get_show(@path, '_buttons.html', 'erb')
      expect(response).to render_template("show")
    end

    it "assigns @library" do
      get_show(@path, '_buttons.html', 'erb')
      expect(assigns(:library)).to_not be_nil
    end

    it "assigns the _buttons.html.erb component file to @library.components" do
      get_show(@path, '_buttons.html', 'erb')
      expect(assigns(:library).components.length).to eq 1
    end

    it "returns a 404 if no components are found" do
      expect {
        get_show(@path, 'headings/_foo.html', 'erb')
      }.to raise_error(ActionController::RoutingError)
    end


  end
end