require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require_relative './config/environments' #database configuration

get '/' do
    haml :index
end

get 'articles' do
end

get '/search' do
end

get '/update' do
end