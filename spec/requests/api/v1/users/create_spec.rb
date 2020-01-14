require 'rails_helper'

describe 'User Create:', type: :request do
  describe 'When a post request is received at to the users api' do
    it 'Sends back an API key if the registration was successful' do
      api_key = 'abcd'
      allow_any_instance_of(Api::V1::Users::UsersController).to receive(:generate_api_key).and_return(api_key)

      post '/api/v1/users', params: {
        email: 'bob@email.com',
        password: 'password',
        password_confirmation: 'password'
      }

      response = JSON.parse(@response.body, symbolize_names: true)

      expect(response[:api_key]).to eq(api_key)
    end
  end
end