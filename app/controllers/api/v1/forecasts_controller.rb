class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = Forecast.new(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end