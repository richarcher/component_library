require 'rails_helper'

RSpec.describe 'library/_componentpattern', type: :view do
  it 'renders' do
    component = instance_double('Library::Component', :paths => [{path: '.', name: 'path'}], :render => 'theme_components/buttons.html.erb', :raw => 'raw')
    assign(:root_path, '/')
    library = instance_double('Library::Librarian', :components => [component], :title => 'component title')
    render partial: 'library/componentpattern', locals: { library: library }
    expect(rendered).to match /Component title/
  end
end