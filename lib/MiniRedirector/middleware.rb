module MiniRedirector
  class MyMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      #status, headers, response = @app.call(env)
			
			header["Location"] = "http://www.google.at"
			status = 301
			response = ["Sie werden weitergeleitet"]
      
			[ status, header, response ]
    end
  end 
end
