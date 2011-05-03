module MiniRedirector
  class MyMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      headers = Hash.new
      headers["Location"] = "http://www.railscasts.com"
      status = 301
      [ status, headers, "You are redirected to railscasts.." ]
    end
  end
end
