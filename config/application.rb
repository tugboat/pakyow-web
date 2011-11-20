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

ENV['TZ'] = 'America/Chicago'

BLOG_TITLE      = "Pakyow Development Blog" unless defined?(BLOG_TITLE)
BLOG_DESC       = "The development blog for Pakyow, an open-source framework for building web apps in Ruby." unless defined?(BLOG_DESC)
BLOG_URL        = "http://pakyow.com" unless defined?(BLOG_URL)
BLOG_COPYRIGHT  = "2011 Bryan Powell" unless defined?(BLOG_COPYRIGHT)

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
        BlogEngine.list
      end
      
      get BlogEngine.post_uri do
        BlogEngine.single
        presenter.view.find('#nav-blog a').add_class('active')
      end
      
      get '/feed' do
        BlogEngine.feed
      end
    end
  end
end
