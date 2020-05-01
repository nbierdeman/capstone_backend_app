class Api::TripsController < ApplicationController
  def index
    @trips = Trip.all
    render "index.json.jb"
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render "show.json.jb"
  end
end
