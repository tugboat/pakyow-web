require 'rubygems'
require 'bundler/setup'

require 'rubygems'
require 'coderay'
require 'rdiscount'
require 'pakyow'

# Production Configuration
if File.exists? '../shared/conf-production.rb'
  require '../shared/conf-production'
end

module PakyowApplication
  class Application < Pakyow::Application
    config.app.default_environment = :development
    
    configure(:development) do
    end
    
    # routes
    routes do
      get '/',      :ApplicationController, :index
      get 'manual', :ApplicationController, :manual
    end
  end
end
