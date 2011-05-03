require 'miniredirector'
require 'rails'

module Miniredirector
    mattr_accessor :redirects
    @@redirects = {}
    
    class Railtie < Rails::Railtie
      # instead of config.app_middleware.use Middleware use (to load the middleware before all others)
      config.app_middleware.insert_before 0, Middleware
      config.miniredirector = Miniredirector
    end
end