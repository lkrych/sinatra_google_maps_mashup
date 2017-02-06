require 'csv'
require_relative '../models/place'

Place.delete_all

CSV.foreach("/app/transformed_us.txt", { :col_sep => "\t" }) do |row|
    Place.create(:id => row[0], :country_code => row[1], :postal_code => row[2], :place_name => row[3], :admin_name1 => row[4], :admin_code1 => row[5], :admin_name2 => row[6], :admin_code2 => row[7], :admin_name3 => row[8], :admin_code3 => row[9], :latitude => row[10], :longitude => row[11], :accuracy => row[12])
    #puts "#{row[2]} was created"
    #local path /home/ubuntu/workspace/pset8/mashup-sinatra/transformed_us.txt
    #heroku path /app/transformed_us.txt
    
end

puts "database is seeded with #{Place.all.count} places"