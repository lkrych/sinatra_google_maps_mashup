require 'csv'
require_relative '../models/place'

Place.delete_all

CSV.foreach("/app/transformed_us.txt", { :col_sep => "\t" }) do |row|
    Place.create(:country_code => row[0], :postal_code => row[1], :place_name => row[2], :admin_name1 => row[3], :admin_code1 => row[4], :admin_name2 => row[5], :admin_code2 => row[6], :admin_name3 => row[7], :admin_code3 => row[8], :latitude => row[9], :longitude => row[10], :accuracy => row[11])
    #puts "#{row[2]} was created"
    
end

puts "database is seeded with #{Place.all.count} places"