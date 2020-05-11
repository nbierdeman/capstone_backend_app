class Api::TripsController < ApplicationController
  before_action :authenticate_user

  def index
    @trips = current_user.trips
    render "index.json.jb"
  end

  def create
    @trip = Trip.new(
      duration: params[:duration],
      distance: params[:distance],
      mode: params[:mode],
      trip_type: params[:trip_type],
      user_id: current_user.id,
    )
    if @trip.save
      render "create.json.jb"
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def show
    @trip = current_user.trips.find_by(id: params[:id])
    @trip_coordinates = TripCoordinate.where(trip_id: @trip.id)
    @observations = []
    @trip_coordinates.each do |trip_coordinate|
      @observations << Observation.where(trip_coordinate_id: trip_coordinate.id)
    end
    render "show.json.jb"
  end

  def update
    @trip = current_user.trips.find_by(id: params[:id])
    @trip.mode = params[:mode] || @trip.mode
    if @trip.save
      render "update.json.jb"
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def destroy
    @trip = current_user.trips.find_by(id: params[:id])
    @trip.destroy
    render "destroy.json.jb"
  end
end
