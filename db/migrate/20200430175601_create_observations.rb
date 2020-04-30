class CreateObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :observations do |t|
      t.decimal :value
      t.string :uom
      t.datetime :timestamp
      t.string :sensor_path
      t.string :node_vsn
      t.decimal :longitude
      t.decimal :latitude
      t.integer :trip_coordinate_id

      t.timestamps
    end
  end
end
