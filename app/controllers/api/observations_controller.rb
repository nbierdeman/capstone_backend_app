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
end
