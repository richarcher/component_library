require "rails_helper"

RSpec.describe "routes to the widgets controller", :type => :routing do
  it "routes to library#index" do
    expect(:get => "/components")
      .to route_to(controller: 'library', action: 'index')
  end

  it "routes to library#show" do
    expect(:get => "/components/file.html.erb")
      .to route_to( controller: 'library',
                action: 'show',
                path: 'file.html',
                format: 'erb')
  end
end