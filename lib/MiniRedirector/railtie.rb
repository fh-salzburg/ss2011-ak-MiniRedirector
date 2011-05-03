require 'miniredirector'
require 'rails'

module Miniredirector
    mattr_accessor :redirects
    @@redirects = {}
    
    class Railtie < Rails::Railtie
      config.miniredirector = Miniredirector
      initializer "miniredirector.initialize" do |app|
        app.middleware.insert_before 0, Miniredirector::Middleware
      end
    end
end