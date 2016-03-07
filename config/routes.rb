Rails.application.routes.draw do
  get "#{ComponentLibrary.root_path}/", to: 'library#index', as: "components"
  get "#{ComponentLibrary.root_path}/*path", to: 'library#show', as: "component"
end
