require 'rails_helper'

describe 'RoadTrip create:', type: :request do
  describe 'When I visit the api endpoint for /road_trip with a city and state' do
    it 'I get a response with the origin, destination, and weather at the destination upon arrival', :vcr do
      User.create(
        email: 'bob@email.com',
        password: 'password',
        password_confirmation: 'password',
        api_key: 'asdf'
      )

      request_body = {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      post '/api/v1/road_trip', params: request_body.to_json

      binding.pry

      response = JSON.parse(@response.body, symbolize_names: true)[:data][:attributes]

      expect(response[:origin][:city]).to eq('Denver')
      expect(response[:origin][:state]).to eq('CO')
      expect(response[:destination][:city]).to eq('Pueblo')
      expect(response[:destination][:state]).to eq('CO')

      expect(response[:travel_time]).to eq('1 hour 48 mins')

      expect(response[:arrival_forecast]).to have_key(:temperature)
      expect(response[:arrival_forecast]).to have_key(:summary)

    end
  end
end