class Api::V1::BackgroundsController < ApplicationController

  def show
    facade = BackgroundFacade.new(params[:location])
    render json: BackgroundSerializer.new(facade)
  end
end