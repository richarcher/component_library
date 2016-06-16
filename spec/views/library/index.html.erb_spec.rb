require 'rails_helper'

RSpec.describe 'library/index', type: :view do
  it 'renders not found message' do
    assign(:configuration, OpenStruct.new(:root_directory => "root_directory"))
    assign(:library, instance_double('Library::Librarian', :components => []))
    render
    expect(response).to match /No html.erb components found at <code>\/app\/views\/root_directory/
  end

  it 'renders found components' do
    component = instance_double('Library::Component', :paths => [{path: '.', name: 'path'}], :render => 'theme_components/buttons.html.erb', :raw => 'raw')
    assign(:library, instance_double('Library::Librarian', :components => [component]))
    assign(:component_template, "library/componentpattern.html.erb")
    stub_template "library/_componentpattern.html.erb" => "Lovely button component"
    render
    expect(response).to match /Lovely button component/
  end
end