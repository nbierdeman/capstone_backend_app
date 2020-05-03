class Api::TripCoordinatesController < ApplicationController
  def index
    @trip_coordinates = TripCoordinate.all
    render "index.json.jb"
  end

  def create
    @trip_coordinate = TripCoordinate.new(
      longitude: params[:longitude],
      latitude: params[:latitude],
      trip_id: params[:trip_id],
    )
    if @trip_coordinate.save
      render "create.json.jb"
    else
      render json: { errors: @trip_coordinate.errors.full_messages }, status: 422
    end
  end

  def show
    @trip_coordinate = TripCoordinate.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @trip_coordinate = TripCoordinate.find_by(id: params[:id])
    @trip_coordinate.longitude = params[:longitude] || @trip_coordinate.longitude
    @trip_coordinate.latitude = params[:latitude] || @trip_coordinate.latitude
    @trip_coordinate.trip_id = params[:trip_id] || @trip_coordinate.trip_id
    if @trip_coordinate.save
      render "update.json.jb"
    else
      render json: { errors: @trip_coordinate.errors.full_messages }, status: 422
    end
  end

  def destroy
    @trip_coordinate = TripCoordinate.find_by(id: params[:id])
    @trip_coordinate.destroy
    render "destroy.json.jb"
  end
end
