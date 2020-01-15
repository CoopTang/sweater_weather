class Api::V1::RoadTripsController < ApplicationController
  before_action :validate_user

  def show
    facade = RoadTripFacade.new(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(facade)
  end

  private

  def validate_user
    user = User.find_by(api_key params[:api_key])
    render json { message: 'Unauthorized'}, status: 401 unless user
  end
end