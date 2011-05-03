require 'miniredirector'
require 'rails'

module Miniredirector
    
    class Railtie < Rails::Railtie
      initializer "miniredirector.initialize" do |app|
        app.middleware.use Miniredirector::Middleware
      end
    end
end