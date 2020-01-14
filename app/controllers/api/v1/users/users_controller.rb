require 'securerandom'
class Api::V1::Users::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: { api_key: user.api_key}
    else
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
end