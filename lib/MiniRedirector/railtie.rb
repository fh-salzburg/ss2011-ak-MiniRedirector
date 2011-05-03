require 'miniredirector'
require 'rails'

module Miniredirector
    
    class Railtie < Rails::Railtie
      config.app_middleware.use Middleware
    end
end