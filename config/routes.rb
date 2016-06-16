Rails.application.routes.draw do
  clc = ComponentLibrary.configuration
  get ':root_path/', to: 'library#index', as: 'components', constraints: lambda { |request|
    clc.root_paths.any? { |root_path| request.original_fullpath.include?(root_path)}
  }
  get ':root_path/*path', to: 'library#show', as: 'component', constraints: lambda { |request|
      clc.root_paths.any? { |root_path| request.original_fullpath.include?(root_path) }
  }
end
