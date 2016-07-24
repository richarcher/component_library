# Component Library [![Build Status](https://travis-ci.org/richarcher/component_library.svg?branch=master)](https://travis-ci.org/richarcher/component_library)

Easily create your own HTML/CSS/JS component library.

## Installation

Add this line to your application's Gemfile:

    gem 'component_library'

And then execute:

    $ bundle
    $ bundle exec rails generate component_library:install components

## Usage

* create a component inside (eg: `app/views/components/_icons.html.erb`)
* add markup to component
* visit /components in a browser

## Overrideable defaults

By default the component library will assume to use the application layout and CSS file (`application.html.erb` & `application.css`), in addition to some basic styles added by the gem itself. If you wish to override this feature and use a different stylesheet, change the root file path, or the url the library routes to, these can be configued inside an initializer.

```
  ComponentLibrary.configure do |config|
    config.application_css = "new_application_css"
    config.root_path       = "new_component_library"
    config.root_directory  = "new_view_directory"
  end
```

If you want to use a totally different layout for your component library, simply create a new layout named `component_library.html.erb` in your layouts directory and change there as appropriate.

## Multiconfiguration option

It is possible to allow multiple instances of a component library to be created - for example if you wanted to use the same components, but test different stylesheets at different urls:

```
  ComponentLibrary.configure do |config|
    config.multiconfigure = [
      {
        root_directory: "theme_components",
        root_path: "theme_1_components",
        application_css: "theme_1_css"
      },
      {
        root_directory: "theme_components",
        root_path: "theme_2_components",
        application_css: "theme_2_css"
      }
    ]
  end
```

Or if you want entirely different component libraries - for example a library for your public facing site, one for the admin section, and one for another part of your site...:

```
  ComponentLibrary.configure do |config|
    config.multiconfigure = [
      {
        root_directory: "public_components",
        root_path: "public-components",
        application_css: "application_css"
      },
      {
        root_directory: "admin_components",
        root_path: "admin-components",
        application_css: "admin_css"
      },
      ...
    ]
  end
```

## Contributing

1. Fork it ( https://github.com/richarcher/component_library/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
