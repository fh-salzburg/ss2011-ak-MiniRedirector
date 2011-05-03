module Miniredirector
  class Middleware
    
    def initialize(app)
      @app = app
    end

    def call(env)
      destination = env["PATH_INFO"]
      if Miniredirector.redirects.key?(destination)
        #[status, headers, response]
        [301, {'Location' => Miniredirector.redirects[destination]}, ["You are going to be redirected"]] 
      else
        @app.call(env)
      end
    end
  end
end