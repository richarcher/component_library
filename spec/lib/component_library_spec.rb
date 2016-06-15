require "rails_helper"

RSpec.describe ComponentLibrary, type: :model do

    after :each do
      ComponentLibrary.reset
    end

    describe '.configure' do

      context 'overridden behaviour' do

          before :each do
            ComponentLibrary.configure do |config|
              config.root_directory = 'spec_component'
              config.root_path = '/url/to/library'
              config.application_css = 'spec_application'
            end
          end

          it 'expects a root_directory' do
            expect(ComponentLibrary.configuration.root_directory).to eq 'spec_component'
          end

          it 'expects a root_page' do
            expect(ComponentLibrary.configuration.root_path).to eq '/url/to/library'
          end

          it 'expects a scss filename' do
            expect(ComponentLibrary.configuration.application_css).to eq 'spec_application'
          end

      end

      context 'default behaviour' do

          it 'expects a root_directory' do
            expect(ComponentLibrary.configuration.root_directory).to eq 'component'
          end

          it 'expects a root_page' do
            expect(ComponentLibrary.configuration.root_path).to eq 'components'
          end

          it 'expects a scss filename' do
            expect(ComponentLibrary.configuration.application_css).to eq 'application'
          end

      end

    end


    describe '.reset' do

      it 'resets the configuration to default values' do
        ComponentLibrary.configure do |config|
          config.root_directory = 'spec_component'
          config.root_path = '/url/to/library'
          config.application_css = 'spec_application'
        end
        ComponentLibrary.reset

        expect(ComponentLibrary.configuration.root_directory).not_to eq 'spec_component'
        expect(ComponentLibrary.configuration.root_path).not_to eq '/url/to/library'
        expect(ComponentLibrary.configuration.application_css).not_to eq 'spec_application'
      end

    end

    it 'expects a stylesheet path' do
      expect(ComponentLibrary.stylesheet_path).to eq '_component_library/library'
    end

    it 'expects a javascript path' do
      expect(ComponentLibrary.javascript_path).to eq '_component_library/library'
    end

end