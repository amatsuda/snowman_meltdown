module SnowmanMeltdown
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env).tap do |status, headers, body|
        body.body = body.body.sub /<input name="(_snowman|_e)" type="hidden" value="&#9731;" \/>/, '' if body.respond_to? :body
      end
    end
  end
end
