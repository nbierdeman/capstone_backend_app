class Api::TripCoordinatesController < ApplicationController
  def index
    @trip_coordinates = TripCoordinate.all
    render "index.json.jb"
  end
end
