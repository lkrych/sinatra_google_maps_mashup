require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require_relative './config/environments' #database configuration
require './helpers'


get '/' do
    haml :index
end

get 'articles' do
    json = lookup(params[:geo])
    if request.xhr?
        return json
    end
end

get '/search' do
    places = find(params[:q])
    if request.xhr?
        return places
    end
end

get '/update' do
end

#clear threads
after do
  ActiveRecord::Base.clear_active_connections!
end