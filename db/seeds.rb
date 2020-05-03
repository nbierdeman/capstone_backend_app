# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(first_name: "John", last_name: "Lennon", email: "john@example.com", password: "password")
user2 = User.create!(first_name: "Paul", last_name: "McCartney", email: "paul@example.com", password: "password")
trip1 = Trip.create!(duration: 1329.7, distance: 5233.8, mode: "cycling", trip_type: "directions", user_id: user1.id)
trip2 = Trip.create!(duration: 184.8, distance: 675.2, mode: "cycling", trip_type: "directions", user_id: user2.id)
trip3 = Trip.create!(duration: 140.2, distance: 343.0, mode: "cycling", trip_type: "directions", user_id: user2.id)
trip_coordinate1 = TripCoordinate.create!(longitude: -87.655311, latitude: 41.987919, trip_id: trip1.id)
trip_coordinate2 = TripCoordinate.create!(longitude: -87.655131, latitude: 41.98188, trip_id: trip1.id)
trip_coordinate3 = TripCoordinate.create!(longitude: -87.66843, latitude: 41.981675, trip_id: trip1.id)
trip_coordinate4 = TripCoordinate.create!(longitude: -87.655311, latitude: 41.987919, trip_id: trip2.id)
trip_coordinate5 = TripCoordinate.create!(longitude: -87.655292, latitude: 41.987354, trip_id: trip2.id)
trip_coordinate6 = TripCoordinate.create!(longitude: -87.655311, latitude: 41.987919, trip_id: trip3.id)
Observation.create!(value: -0.17968, uom: "ppm", timestamp: "2020-04-23T23:11:59", sensor_path: "chemsense.so2.concentration", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate1.id)
Observation.create!(value: -0.00815, uom: "ppm", timestamp: "2020-04-23T23:11:59", sensor_path: "chemsense.reducing_gases.concentration", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate1.id)
Observation.create!(value: 0.389, uom: "ppm", timestamp: "2020-04-23T23:11:59", sensor_path: "chemsense.oxidizing_gases.concentration", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate2.id)
Observation.create!(value: 1.242, uom: "μg/m^3", timestamp: "2020-04-23T23:11:59", sensor_path: "alphasense.opc_n2.pm2_5", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate3.id)
Observation.create!(value: 0, uom: "ppm", timestamp: "2020-04-23T23:11:59", sensor_path: "chemsense.o3.concentration", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate4.id)
Observation.create!(value: 0.01461, uom: "ppm", timestamp: "2020-04-23T23:11:59", sensor_path: "chemsense.h2s.concentration", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate5.id)
Observation.create!(value: -0.83334, uom: "ppm", timestamp: "2020-04-23T23:11:59", sensor_path: "chemsense.co.concentration", node_vsn: "072", longitude: -87.71299, latitude: 41.751142, trip_coordinate_id: trip_coordinate6.id)
