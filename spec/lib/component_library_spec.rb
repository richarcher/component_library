require "rails_helper"

RSpec.describe ComponentLibrary, type: :model do

    before :each do
      @root_directory = ComponentLibrary.root_directory
      @root_path = ComponentLibrary.root_path
      @application_css = ComponentLibrary.application_css
    end

    after :each do
      ComponentLibrary.configure do |config|
        config.root_directory = @root_directory
        config.root_path = @root_path
        config.application_css = @application_css
      end
    end


    it 'expects a stylesheet path' do
      expect(ComponentLibrary.stylesheet_path).to eq '_component_library/library'
    end

    it 'expects a javascript path' do
      expect(ComponentLibrary.javascript_path).to eq '_component_library/library'
    end

    context 'overridden behaviour' do

        before :each do
          ComponentLibrary.configure do |config|
            config.root_directory = 'spec_component'
            config.root_path = '/url/to/library'
            config.application_css = 'spec_application'
          end
        end

        it 'expects a root_directory' do
          expect(ComponentLibrary.root_directory).to eq 'spec_component'
        end

        it 'expects a root_page' do
          expect(ComponentLibrary.root_path).to eq '/url/to/library'
        end

        it 'expects a scss filename' do
          expect(ComponentLibrary.application_css).to eq 'spec_application'
        end

    end

    context 'default behaviour' do

        it 'expects a root_directory' do
          expect(ComponentLibrary.root_directory).to eq 'theme_components'
        end

        it 'expects a root_page' do
          expect(ComponentLibrary.root_path).to eq 'components'
        end

        it 'expects a scss filename' do
          expect(ComponentLibrary.application_css).to eq 'application'
        end

    end

end