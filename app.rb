require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongoid'
require 'rack-flash'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'
set :haml, {:format => :html5} # default Haml format is :xhtml
enable :session

# Helpers
require './lib/render_partial'

# Controllers
Dir[settings.root + "controllers/**/*.rb"].each{|f| require f}

# Application routes
get '/' do
  haml :index, :layout => :'layouts/application'
end

get '/about' do
  haml :about, :layout => :'layouts/page'
end
