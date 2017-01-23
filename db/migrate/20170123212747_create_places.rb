class CreatePlaces < ActiveRecord::Migration[5.0]
  def up
    create_table :places do |t|
      t.string :country_code
      t.string :postal_code
      t.string :place_name
      t.string :admin_name1
      t.string :admin_code1
      t.string :admin_name2
      t.string :admin_code2
      t.string :admin_name3
      t.string :admin_code3
      t.float :latitude
      t.float :longitude
      t.integer :accuracy
    end
  end
  
  def down
    drop_table :places
  end
end

