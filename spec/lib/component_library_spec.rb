require "rails_helper"

RSpec.describe ComponentLibrary, type: :model do

    after :each do
      ComponentLibrary.reset
    end

    describe '.configuration' do

      context 'overridden behaviour' do

          before :each do
            @mc = [{
                    root_directory: "mc_components_1",
                    root_path: "mc_components_1",
                    application_css: "mc_application_1"
                  },
                  {
                    root_directory: "mc_components_2",
                    root_path: "mc_components_2",
                    application_css: "mc_application_2"
                  }]

            ComponentLibrary.configure do |config|
              config.root_directory = 'spec_component'
              config.root_path = '/url/to/library'
              config.application_css = 'spec_application'
              config.multiconfigure = @mc
            end
          end

          it 'overrides .root_directory' do
            expect(ComponentLibrary.configuration.root_directory).to eq 'spec_component'
          end

          it 'overrides .root_path' do
            expect(ComponentLibrary.configuration.root_path).to eq '/url/to/library'
          end

          it 'overrides .application_css' do
            expect(ComponentLibrary.configuration.application_css).to eq 'spec_application'
          end

          it 'overrides .multiconfigure' do
            expect(ComponentLibrary.configuration.multiconfigure).to eq @mc
          end

          it 'overrides .root_paths with multiconfigure root paths' do
            expect(ComponentLibrary.configuration.root_paths).to eq ['mc_components_1', 'mc_components_2']
          end

          it 'responds to .for with multiconfigure hash' do
            expect(ComponentLibrary.configuration.for('mc_components_1')).to eq [{  :root_directory => 'mc_components_1',
                                                                                    :root_path => 'mc_components_1',
                                                                                    :application_css => 'mc_application_1'}]
          end

          it 'responds to .for with unavailable multiconfigure hash' do
            expect(ComponentLibrary.configuration.for('foo')).to eq []
          end

      end

      context 'default behaviour' do

          it 'responds to .root_directory' do
            expect(ComponentLibrary.configuration.root_directory).to eq 'component'
          end

          it 'responds to .root_path' do
            expect(ComponentLibrary.configuration.root_path).to eq 'components'
          end

          it 'responds to .application_css' do
            expect(ComponentLibrary.configuration.application_css).to eq 'application'
          end

          it 'responds to .multiconfigure' do
            expect(ComponentLibrary.configuration.multiconfigure).to eq nil
          end

          it 'responds to .root_paths' do
            expect(ComponentLibrary.configuration.root_paths).to eq ["components"]
          end

          it 'responds to .for' do
            expect(ComponentLibrary.configuration.for('foo')).to eq [{:root_path=>"components", :root_directory=>"component", :application_css=>"application"}]
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