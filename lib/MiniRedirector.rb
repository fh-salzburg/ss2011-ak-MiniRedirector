module MiniRedirector
  
  def self.redirects; @@redirects; end
  def self.redirects=(redirects); @@redirects = redirects; end
  @@redirects = Hash.new

  class Railtie < Rails::Railtie
    config.mini_redirector = MiniRedirector
    initializer "mini_redirector.initialize" do |app|
      app.middleware.insert_before 0, MiniRedirector::MyMiddleware
    end
  end

  class MyMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      path = env["PATH_INFO"]
      if MiniRedirector.redirects.key?(path)
        headers = Hash.new
        headers["Location"] = MiniRedirector.redirects[path]
        status = 301
        [ status, headers, "You are redirected to #{MiniRedirector.redirects[path]}" ]
      else
        status, headers, response = @app.call(env)
      end

      [status, headers, response]
    end
  end

end
