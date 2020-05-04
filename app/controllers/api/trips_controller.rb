class Api::TripsController < ApplicationController
  before_action :authenticate_user

  def index
    @trips = Trip.all
    render "index.json.jb"
  end

  def create
    @trip = Trip.new(
      duration: params[:duration],
      distance: params[:distance],
      mode: params[:mode],
      trip_type: params[:trip_type],
      user_id: params[:user_id],
    )
    if @trip.save
      render "create.json.jb"
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if @trip.trip_type == "directions"
      @trip.duration = params[:duration] || @trip.duration
      @trip.distance = params[:distance] || @trip.distance
      @trip.mode = params[:mode] || @trip.mode
    else
      @trip.mode = params[:mode] || @trip.mode
    end
    if @trip.save
      render "update.json.jb"
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy
    render "destroy.json.jb"
  end
end
