require 'sinatra'
require 'sinatra/activerecord'
require 'pry'

get '/' do
    haml :index
end

get '/search' do
end

get '/update' do
end