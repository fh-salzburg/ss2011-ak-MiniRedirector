module Miniredirector
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["PATH_INFO"] == "/"
        [301, {'Location' => 'http://google.com'}, []] #[status, headers, []]
      else
        @app.call(env)
      end
    end
  end
end