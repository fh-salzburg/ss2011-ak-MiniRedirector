require 'MiniRedirector'
require 'Rails'

module MiniRedirector
    mattr_accessor :redirects
    @@redirects = {}
    
    class Railtie < Rails::Railtie
      config.MiniRedirector = MiniRedirector
      initializer "MiniRedirector.initialize" do |app|
        app.middleware.insert_before Rack::Lock, MiniRedirector::MyMiddleware
      end
    end
end
