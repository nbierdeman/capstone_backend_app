class Api::ObservationsController < ApplicationController
  def index
    @observations = Observation.all
    render "index.json.jb"
  end
end
