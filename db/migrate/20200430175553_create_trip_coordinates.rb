class CreateTripCoordinates < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_coordinates do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.integer :trip_id

      t.timestamps
    end
  end
end
