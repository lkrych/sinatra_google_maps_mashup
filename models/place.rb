class Place < ActiveRecord::Base
    def self.flex_search(q)
        return Place.limit(10).where("postal_code like ? OR place_name like ? OR admin_name1 like ?", "#{q}%","#{q}%","#{q}%")
    end
end