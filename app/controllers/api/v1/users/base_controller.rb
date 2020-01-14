class Api::V1::Users::BaseController < ApplicationController
  before_action :set_headers

  def set_headers
    response.set_header('Content-Type', 'application/json')
    response.set_header('Accept', 'application/json')
  end
end
