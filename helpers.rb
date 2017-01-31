require 'rss'
require 'httparty'
require 'json'
require 'active_support/core_ext/hash'
require 'pry'


def lookup(geo)
    
    #grab articles from google news and return in json format
    uri = HTTParty.get("https://news.google.com/news/feeds?geo=" + geo + "&output=rss")
    rss = RSS::Parser.parse(uri, false)
    if rss.nil?
        rss =  RSS::Parser.parse("http://www.theonion.com/feeds/rss", false)
    end
    
    #add items from rss feed to hash
    results_arr = []
    rss.items.each do |item|
        results_arr << {"link": item.link, "title": item.title}
    end
    
   results_arr.to_json
   
   return results_arr
    
end

