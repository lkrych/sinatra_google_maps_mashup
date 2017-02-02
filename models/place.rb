class Place < ActiveRecord::Base
    def self.flex_search(q)
        return Place.limit(10).where("postal_code like ? OR place_name like ? OR admin_name1 like ?", "#{q}%","#{q}%","#{q}%").as_json
    end
    
    def self.update_view(sw_lat,sw_lng,ne_lat,ne_lng)
        
        if sw_lng.to_f.abs >= ne_lng.to_f.abs
            #doesn't cross the antimeridian
            places = self.limit(10).where("#{sw_lat} <= latitude AND latitude <= #{ne_lat} AND (#{sw_lng} <= longitude AND longitude <= #{ne_lng})").group([:country_code, :place_name, :admin_code1]).order("RANDOM()").as_json
            
        else
            #crosses the antimeridian
            places = self.limit(10).where("#{sw_lat} <= latitude AND latitude <= #{ne_lat} AND (#{sw_lng} <= longitude OR longitude <= #{ne_lng})").group([:country_code, :place_name, :admin_code1]).order("RANDOM()").as_json
            
        end
        
        return places
    end
end