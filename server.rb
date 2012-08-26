Bundler.require
require 'sinatra/reloader'

set :views, 'source'

get '/' do
  haml :index
end

get '/style.css' do
  content_type 'text/css'
  Sass.compile(File.read(File.dirname(__FILE__) + "/source/style.sass"), syntax: :sass)
end

get '/app.js' do
  coffee :app
end
