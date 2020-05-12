class Api::MapsController < ApplicationController
  def set_waypoints
    @route = params[:route]
    render json: { message: "Got the route!" }
    @waypoints = []
    @route["route"][0]["legs"][0]["steps"].each do |maneuver|
      @waypoints << maneuver["intersections"][0]["location"]
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

    # get the closest node coordinates for each waypoint by looping through the @node_coordinates array
    @closest_node_coordinates = []

    # get the vsn for each of the @closest_node_coordinates
    @node_vsns = []

    #get first air quality observation for each of the node_vsns array
    response2 = HTTP.get("https://api.arrayofthings.org/api/observations?project=chicago&node=072")
    @observations = response2.parse

    render "air_quality.json.jb"
  end
end
