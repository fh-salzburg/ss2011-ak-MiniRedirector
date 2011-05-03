module Miniredirector
  class Middleware
    def initialize app
      @app = app
    end
    
    def call env
      header = {}
      header["Location"] = "http://www.google.com/"
      status = 301
      response = ["ftw!"]
      
      [status, header, response]
    end
  end
end