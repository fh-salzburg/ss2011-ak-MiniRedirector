module Miniredirector
  class Middleware
    def initialize app
      @app = app
    end
    
    def call env
      path = env["PATH_INFO"]
      if Miniredirector.redirects.key? path
        header = {}
        header["Location"] = Miniredirector.redirects[path]
        status = 301
        response = ["ftw!"]
      else
        status, header, response = @app.call(env)
      end
      
      [status, header, response]
    end
  end
end