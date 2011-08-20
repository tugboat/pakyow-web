env = ENV['RACK_ENV'] || 'production'

# Include Application
require 'config/application'
PakyowApplication::Application.stage(env.to_sym)

app = Rack::Builder.new do
  use Rack::MethodOverride
  
  run PakyowApplication::Application.new
end.to_app

run Rack::Session::Cookie.new(app)
