class Api::ObservationsController < ApplicationController
  def index
    @observations = Observation.all
    render "index.json.jb"
  end

  def create
    @observation = Observation.new(
      value: params[:value],
      uom: params[:uom],
      timestamp: params[:timestamp],
      sensor_path: params[:sensor_path],
      node_vsn: params[:node_vsn],
      longitude: params[:longitude],
      latitude: params[:latitude],
      trip_coordinate_id: params[:trip_coordinate_id],
    )
    if @observation.save
      render "create.json.jb"
    else
      render json: { errors: @observation.errors.full_messages }, status: 422
    end
  end

  def show
    @observation = Observation.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @observation = Observation.find_by(id: params[:id])
    @observation.value = params[:value] || @observation.value
    @observation.uom = params[:uom] || @observation.uom
    @observation.timestamp = params[:timestamp] || @observation.timestamp
    @observation.sensor_path = params[:sensor_path] || @observation.sensor_path
    @observation.node_vsn = params[:node_vsn] || @observation.node_vsn
    @observation.longitude = params[:longitude] || @observation.longitude
    @observation.latitude = params[:latitude] || @observation.latitude
    @observation.trip_coordinate_id = params[:trip_coordinate_id] || @observation.trip_coordinate_id
    if @observation.save
      render "update.json.jb"
    else
      render json: { errors: @observation.errors.full_messages }, status: 422
    end
  end
end
