class RenameTripsTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :trips, :type, :trip_type
  end
end
