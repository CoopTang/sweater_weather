class Api::V1::AntipodesController < ApplicationController

  def index
    facade = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(facade.antipodes)
  end
end