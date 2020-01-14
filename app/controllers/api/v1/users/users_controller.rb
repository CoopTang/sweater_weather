require 'securerandom'
class Api::V1::Users::UsersController < ApplicationController
  before_action :set_headers

  def create
    user = User.new(user_params)
    if user.save
      render json: { api_key: user.api_key }
    else
      render json: { message: user.errors.full_messages.to_sentence }, status: 400
    end
  end
  
  private
  
  def user_params
    { api_key: generate_api_key}
    .merge(params.permit(:email, :password, :password_confirmation))
  end
  
  def generate_api_key
    SecureRandom.urlsafe_base64
  end
  
  def set_headers
    response.set_header('Content-Type', 'application/json')
    response.set_header('Accept', 'application/json')
  end
end