class Api::MapsController < ApplicationController
  def route
    @route = params[:route]
    render json: { message: "Got the route!" }
    @waypoints = []
    @route["route"][0]["legs"][0]["steps"].each do |maneuver|
      @waypoints << maneuver["intersections"][0]["location"]
    end
  end

  def directions
    response1 = HTTP.get("https://api.mapbox.com/directions/v5/mapbox/cycling/#{params[:start_lng]}%2C#{params[:start_lat]}%3B#{params[:end_lng]}%2C#{params[:end_lat]}?alternatives=false&geometries=geojson&steps=true&access_token=#{Rails.application.credentials.maps_api[:mapbox_key]}")
    @directions = response1.parse

    # @waypoints = @directions["routes"][0]["geometry"]["coordinates"]

    # response2 = HTTP.get("https://api.arrayofthings.org/api/nodes?project=chicago")
    # @nodes = response2.parse

    # @node_coordinates = []
    # @nodes["data"].each do |node|
    #   @node_coordinates << node["location"]["geometry"]["coordinates"]
    # end

    # response3 = HTTP.get("https://api.arrayofthings.org/api/nodes?location=within:#{@directions["routes"][0]["geometry"]["coordinates"]}")
    # @nodes = response3.parse

    response4 = HTTP.get("https://api.arrayofthings.org/api/observations?project=chicago&node=072")
    @observations = response4.parse

    render "directions.json.jb"
  end
end
