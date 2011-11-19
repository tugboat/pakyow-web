require 'rubygems'
require 'bundler/setup'

require 'rubygems'
# require 'coderay'
require 'pygments'
require 'rdiscount'

require 'pakyow'

require 'blog_engine'

# Production Configuration
if File.exists? '../shared/conf-production.rb'
  require '../shared/conf-production'
end

module PakyowApplication
  class Application < Pakyow::Application
    config.app.default_environment = :development
    
    configure(:development) do
      require 'pp'
    end
    
    handlers do
      handler :not_found, 404 do
        presenter.use_view_path('errors/404')
      end
      
      handler :fail, 500 do
        presenter.use_view_path('errors/500')
      end
    end
    
    routes do
      get '/',          :ApplicationController, :index
      get '/manual',    :ApplicationController, :manual
      get '/community', :ApplicationController, :community
      
      get '/posts' do
        presenter.view.find('#nav-blog a').add_class('active')
        # BlogEngine.list
      end
      
      get BlogEngine.post_uri do
        presenter.view.find('#nav-blog a').add_class('active')
        BlogEngine.single
      end
      
      get '/feed' do
        BlogEngine.feed
      end
    end
  end
end
