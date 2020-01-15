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

      allow_any_instance_of(RoadTripFacade).to receive(:current_time).and_return(1579057307)

      post '/api/v1/road_trip', params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "asdf"
      }

      response = JSON.parse(@response.body, symbolize_names: true)[:data][:attributes]

      expect(response[:origin][:city]).to eq('Denver')
      expect(response[:origin][:state]).to eq('CO')
      expect(response[:destination][:city]).to eq('Pueblo')
      expect(response[:destination][:state]).to eq('CO')

      expect(response[:travel_time]).to eq('1 hour 48 mins')

      expect(response[:arrival_forecast]).to have_key(:temperature)
      expect(response[:arrival_forecast]).to have_key(:summary)
    end

    it 'I get an invalid response if there is no API key', :vcr do
      post '/api/v1/road_trip', params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO"
      }

      response = JSON.parse(@response.body, symbolize_names: true)

      expect(@response.status).to eq(401)
      expect(response[:message]).to eq('Unauthorized')
    end

    it 'I get an invalid response if there the API key is incorrect', :vcr do
      User.create(
        email: 'bob@email.com',
        password: 'password',
        password_confirmation: 'password',
        api_key: 'asdf'
      )

      post '/api/v1/road_trip', params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "wrong key"
      }

      response = JSON.parse(@response.body, symbolize_names: true)

      expect(@response.status).to eq(401)
      expect(response[:message]).to eq('Unauthorized')
    end
  end
end