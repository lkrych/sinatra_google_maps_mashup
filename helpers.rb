require 'rss'
require 'httparty'
require 'json'
# require 'sinatra'
# require 'sinatra/activerecord'
require 'active_support/core_ext/hash'
require_relative './models/place'
# require_relative './config/environments' #database configuration
require 'pry'



def lookup(geo)
    return nil if geo.nil?
    
    #geo will be postal code
    #grab articles from google news and return in json format
    uri = HTTParty.get("https://news.google.com/news/feeds?geo=" + geo + "&output=rss")
    rss = RSS::Parser.parse(uri, false)
    if rss.nil?
        rss =  RSS::Parser.parse("http://www.theonion.com/feeds/rss", false)
    end
    
    #add items from rss feed to hash
    results_arr = []
    rss.items.each do |item|
        results_arr << {:link => item.link, :title => item.title}
    end
    
    results_arr.to_json

   
    return results_arr
    
end

def find(query)
    #takes in postal code, city, or state
    #search flexibly through the db
    places = Place.flex_search(query)
    #use inject to populate results arr
    
    return places
end

def prettify(json)
    return nil if json.nil?
    return JSON.pretty_generate(json)
end