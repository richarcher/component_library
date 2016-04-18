require "rails_helper"

RSpec.describe ComponentLibrary::LibraryController, :type => :controller do

  describe "GET #index" do

    before :each do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "assigns @library" do
      expect(assigns(:library)).to_not be_nil
    end

    it "assigns all component files to @library.components" do
      expect(assigns(:library).components.length).to eq 3
    end

  end

  describe "GET #show" do
    def get_show(url, format=nil)
      @url = url
      get :show, path: url, format: format
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

    it "returns a 404 if no components are found" do
      expect {
        get_show('headings/_foo.html', 'erb')
      }.to raise_error(ActionController::RoutingError)
    end

  end
end