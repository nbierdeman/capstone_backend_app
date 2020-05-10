class Api::MapsController < ApplicationController
  def directions
    response = HTTP.get("https://api.mapbox.com/directions/v5/mapbox/cycling/#{params[:start_lng]}%2C#{params[:start_lat]}%3B#{params[:end_lng]}%2C#{params[:end_lat]}?alternatives=false&geometries=geojson&steps=true&access_token=#{Rails.application.credentials.maps_api[:mapbox_key]}")
    @directions = response.parse
    render "index.json.jb"
  end
end
