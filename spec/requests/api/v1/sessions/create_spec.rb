require 'rails_helper'

describe 'Sessions Create:', type: :request do
  describe 'When a post request is received at to the sessions api' do
    it 'Sends back an API key if the credentials were correct' do
      User.create(
        email: 'bob@email.com',
        password: 'password',
        password_confirmation: 'password',
        api_key: 'asdf'
      )

      post '/api/v1/sessions', params: {
        email: 'bob@email.com',
        password: 'password'
      }
      
      response = JSON.parse(@response.body, symbolize_names: true)
      
      expect(@response.status).to eq(200)
      expect(response[:api_key]).to eq('asdf')
    end

    it 'Sends back a message if there are valid credentials' do
      post '/api/v1/sessions', params: {
        email: 'bob@email.com',
        password: 'password',
      }
      
      response = JSON.parse(@response.body, symbolize_names: true)

      expect(@response.status).to eq(400)
      expect(response[:message]).to eq("Invalid credentials.")
    end
  end
end