require File.join(File.dirname(__FILE__), 'snowman_meltdown/target_extractor')
require File.join(File.dirname(__FILE__), 'snowman_meltdown/middleware')

module SnowmanMeltdown
  class Railtie < Rails::Railtie
    initializer 'add middleware' do |app|
      SnowmanMeltdown::Middleware.snowmanish = TargetExtractor.new.extract
      app.middleware.use SnowmanMeltdown::Middleware
    end
  end
end
