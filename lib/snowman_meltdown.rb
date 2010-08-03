require File.join(File.dirname(__FILE__), 'snowman_meltdown/middleware')

module SnowmanMeltdown
  class Engine < Rails::Engine
    initializer 'add middleware' do |app|
      app.middleware.use SnowmanMeltdown::Middleware
    end
  end
end
