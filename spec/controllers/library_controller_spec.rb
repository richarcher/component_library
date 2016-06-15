require "rails_helper"

RSpec.describe ComponentLibrary::LibraryController, :type => :controller do


  before do
    allow(ComponentLibrary.configuration).to receive(:root_path).and_return('components')
    allow(ComponentLibrary.configuration).to receive(:root_directory).and_return('theme_components')
  end

  describe "GET #index" do

    def get_index(view=nil)
      get :index, view: view
    end

    it "responds successfully with an HTTP 200 status code" do
      get_index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get_index
      expect(response).to render_template("index")
    end

    it "assigns @library" do
      get_index
      expect(assigns(:library)).to_not be_nil
    end

    it "assigns @component_template" do
      get_index
      expect(assigns(:component_template)).to eq 'componentpattern'
    end

    it "assigns all component files to @library.components" do
      get_index
      expect(assigns(:library).components.length).to eq 3
    end

    it "assigns @component_template with isolation pattern if paramter is provided" do
      get_index('isolation')
      expect(assigns(:component_template)).to eq 'isolationpattern'
    end

  end

  describe "GET #show" do
    def get_show(url, format=nil, view=nil)
      @url = url
      get :show, path: url, format: format, view: view
    end

    it "responds successfully with an HTTP 200 status code" do
      get_show('_buttons.html', 'erb')
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get_show('_buttons.html', 'erb')
      expect(response).to render_template("show")
    end

    it "assigns @library" do
      get_show('_buttons.html', 'erb')
      expect(assigns(:library)).to_not be_nil
    end

    it "assigns the _buttons.html.erb component file to @library.components" do
      get_show('_buttons.html', 'erb')
      expect(assigns(:library).components.length).to eq 1
    end

    it "assigns @component_template" do
      get_show('_buttons.html', 'erb')
      expect(assigns(:component_template)).to eq 'componentpattern'
    end

    it "assigns @component_template with isolation pattern if paramter is provided" do
      get_show('_buttons.html', 'erb', 'isolation')
      expect(assigns(:component_template)).to eq 'isolationpattern'
    end

    it "returns a 404 if no components are found" do
      expect {
        get_show('headings/_foo.html', 'erb')
      }.to raise_error(ActionController::RoutingError)
    end


  end
end