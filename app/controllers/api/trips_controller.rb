class Api::TripsController < ApplicationController
  def index
    @trips = Trip.all
    render "index.json.jb"
  end
end
