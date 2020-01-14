require 'rails_helper'

describe 'Antipode Show:', type: :request do
  describe 'When I visit the api endpoint for /antipode with a city and state' do
    xit 'should give me the weather information for that antipode of a given location' do
      get '/api/v1/antipode?location=hong kong'

      response = JSON.parse(@response.body, symbolize_names: true)

      data = response[:data].first
      id = data[:id]
      type = data[:type]
      attributes = data[:attributes]
      search_location = data[:search_location]
      location_name = attributes[:location_name]
      forecast = attributes[:forecast]
      summary = forecast[:summary]
      current_temperature = forecast[:current_temperature]

      expect(response).to have_key(:data)
      expect(data).to be_an(Array)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)
      expect(data).to have_key(:search_location)

      expect(attributes).to have_key(:location_name)
      expect(attributes).to have_key(:forecast)

      expect(forecast).to have_key(:summary)
      expect(forecast).to have_key(:current_temperature)

      expect(id).to eq(1)
      expect(type).to eq('antipode')
      expect(location_name).to eq("RP69, Jujuy, Argentina")
    end
  end
end