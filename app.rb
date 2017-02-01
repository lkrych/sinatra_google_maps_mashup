require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require_relative './config/environments' #database configuration
require './helpers'


get '/' do
    haml :index
end

get '/articles' do
    @json = lookup(params[:geo])
    if request.xhr?
        return @json
    else
        content_type :json
        @json
    end

end

get '/search' do
    @json = prettify(find(params[:q]))
    if request.xhr?
        return @json
    else
        content_type :json
        @json
    end
end

get '/update' do
    #returns 10 places within field of view
    
    # #ensure parameters are present
    # unless params.has_key?(:sw)
    #     raise "missing sw"
    # end
    
    # unless params.has_key?(:ne)
    #     raise "missing ne"
    # end
    
    # #ensure parameters are in lat,lng format
    
    # unless /^-?\d+(?:\.\d+)?,-?\d+(?:\.\d+)?$/.match(params[:sw])
    #     raise "invalid sw"
    # end
    
    # unless /^-?\d+(?:\.\d+)?,-?\d+(?:\.\d+)?$/.match(params[:ne])
    #     raise "invalid ne"
    # end
    
    # #explode southwest corner into two variables
    # sw_lat,sw_lng = params[:sw].split(",").to_f
    
    # puts "sw_lat is #{sw_lat}, sw_long is #{sw_long}"
    # #explore northeast corner into two variables
    
    # ne_lat,ne_lng = params[:ne].split(",").to_f
    
    # puts "ne_lat is #{ne_lat}, ne_long is #{ne_long}"
    # #find 10 cities within view, pseudorandomly chosen if more are present
    
    # return Place.update_view(sw_lat,sw_lng,ne_lat,ne_lng)
end

#clear threads
after do
  ActiveRecord::Base.clear_active_connections!
end