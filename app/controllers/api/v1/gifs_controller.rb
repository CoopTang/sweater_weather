class Api::V1::GifsController < ApplicationController

  def show
    facade = GifFacade.new(params[:location])
    render json: GifSerializer.new(facade)
  end

end