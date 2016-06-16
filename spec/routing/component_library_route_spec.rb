require "rails_helper"

RSpec.describe "routes to the widgets controller", :type => :routing do

  let(:request) { double }

  before :each do
    allow_any_instance_of(ComponentLibrary::Configuration).to receive(:root_paths).and_return(['/foo_bar'])
    allow(request).to receive(:original_fullpath).and_return('/foo_bar')
  end

  it "routes to library#index" do
    expect(:get => "/foo_bar")
      .to route_to( controller: 'library',
                action: 'index',
                root_path: 'foo_bar')
  end

  it "routes to library#show" do
    expect(:get => "/foo_bar/file.html.erb")
      .to route_to( controller: 'library',
                action: 'show',
                path: 'file.html',
                root_path: 'foo_bar',
                format: 'erb')
  end
end