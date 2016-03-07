require "rails_helper"

RSpec.describe Library::Component, :type => :model do

  before :each do
    @filename = '/bar/foo/bar/fileroot/views/_file.html'
    @content = '<h1>heading</h1>'
    @component = Library::Component.new(@filename, 'fileroot')
    allow(File).to receive(:open).with(@filename).and_return( StringIO.new(@content) )
  end

  it "correctly responds to .raw" do
    expect(@component.raw).to eq(@content)
  end

  it "correctly responds to .render" do
    expect(@component.render).to eq('file.html')
  end

  it "correctly responds to .paths" do
    expect(@component.paths.length).to eq 3
    expect(@component.paths[0]).to match({path: ".", name: "components"})
    expect(@component.paths[1]).to match({path: "views", name: "views"})
    expect(@component.paths[2]).to match({path: "views/_file.html", name: "_file.html"})
  end

end