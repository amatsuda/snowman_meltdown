module SnowmanMeltdown
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call env
      body.body = body.body.sub '<input name="_snowman" type="hidden" value="&#9731;" />', '' if body.respond_to? :body
      [status, headers, body]
    end
  end
end
