Rails.application.routes.draw do
  get "#{ComponentLibrary.configuration.root_path}/", to: 'library#index', as: "components"
  get "#{ComponentLibrary.configuration.root_path}/*path", to: 'library#show', as: "component"
end
