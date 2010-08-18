module SnowmanMeltdown
  class Middleware
    cattr_writer :snowmanish

    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env).tap do |status, headers, body|
        body.body = body.body.sub @@snowmanish, '' if body.respond_to? :body
      end
    end
  end
end
