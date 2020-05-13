class Api::MapsController < ApplicationController
  def set_waypoints
    @route = params[:route]
    render json: { message: "Got the route!" }
    $waypoints = []
    @route["route"][0]["legs"][0]["steps"].each do |maneuver|
      $waypoints << maneuver["intersections"][0]["location"]
    end
  end

  def air_quality
    # get up-to-date chicago node information
    response1 = HTTP.get("https://api.arrayofthings.org/api/nodes?project=chicago")
    @nodes = response1.parse

    # get coordinates of each node in chicago
    @node_coordinates = []
    @nodes["data"].each do |node|
      @node_coordinates << node["location"]["geometry"]["coordinates"]
    end

    # get the closest node coordinates for each waypoint by looping through the @node_coordinates array; don't forget to .uniq! it
    @closest_node_coordinates = []
    $waypoints.each do |waypoint|
      lowest_magnitude = 10000000000
      lowest_magnitude_coordinate = nil
      @node_coordinates.each do |node_coordinate|
        magnitude = Math.sqrt((node_coordinate[0] - waypoint[0]) ** 2 + (node_coordinate[1] - waypoint[1]) ** 2)
        if magnitude < lowest_magnitude
          lowest_magnitude = magnitude
          lowest_magnitude_coordinate = node_coordinate
        end
      end
      @closest_node_coordinates << lowest_magnitude_coordinate
    end

    # get the vsn for each of the @closest_node_coordinates
    @node_vsns = []

    #get first air quality observation for each of the node_vsns array
    response2 = HTTP.get("https://api.arrayofthings.org/api/observations?project=chicago&node=072&senor[]=alphasense.opc_n2.pm2_5&sensor[]=alphasense.opc_n2.pm10")
    @observations = response2.parse

    render "air_quality.json.jb"
  end
end
