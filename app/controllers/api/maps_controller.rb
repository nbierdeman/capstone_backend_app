class Api::MapsController < ApplicationController
  def directions
    response1 = HTTP.get("https://api.mapbox.com/directions/v5/mapbox/cycling/#{params[:start_lng]}%2C#{params[:start_lat]}%3B#{params[:end_lng]}%2C#{params[:end_lat]}?alternatives=false&geometries=geojson&steps=true&access_token=#{Rails.application.credentials.maps_api[:mapbox_key]}")
    @directions = response1.parse

    @waypoints = @directions["routes"][0]["geometry"]["coordinates"]

    response2 = HTTP.get("https://api.arrayofthings.org/api/nodes?project=chicago")
    @nodes = response2.parse

    render "directions.json.jb"
  end
end
