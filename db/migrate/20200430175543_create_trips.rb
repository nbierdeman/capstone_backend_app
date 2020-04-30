class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.float :duration
      t.float :distance
      t.string :mode
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
