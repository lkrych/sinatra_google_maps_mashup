require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require_relative './config/environments' #database configuration
require './helpers'
require 'sinatra/cacher'

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
    if request.xhr?
    end
end

get '/update' do
end