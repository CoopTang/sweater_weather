class Api::V1::Users::SessionsController < Api::V1::Users::BaseController
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: { api_key: user.api_key }, status: 200
    else
      render json: { message: 'Invalid credentials.'}, status: 400
    end
  end
end