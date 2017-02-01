class Place < ActiveRecord::Base
    def self.flex_search(q)
        return Place.limit(10).where("postal_code like ? OR place_name like ? OR admin_name1 like ?", "#{q}%","#{q}%","#{q}%").as_json
    end
    
    def self.update_view(sw_lat,sw_lng,ne_lat,ne_lng)
        
        results_arr = []
        
        if sw_lng <= ne_lng
            #doesn't cross the antimeridian
            places =  Place.limit(10).where("SELECT * FROM places
            WHERE :sw_lat <= latitude AND latitude <= :ne_lat AND (:sw_lng <= longitude AND longitude <= :ne_lng)
            GROUP BY country_code, place_name, admin_code1
            ORDER BY RANDOM()")
        else
            #crosses the antimeridian
            places =  Place.limit(10).where("SELECT * FROM places
            WHERE :sw_lat <= latitude AND latitude <= :ne_lat AND (:sw_lng <= longitude OR longitude <= :ne_lng)
            GROUP BY country_code, place_name, admin_code1
            ORDER BY RANDOM()")
        end
        
        places.inject(results_arr) {|res_arr, place| res_arr << place.to_json}
        
        return results_arr
    end
end