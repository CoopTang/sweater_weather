require 'rails_helper'

describe 'Forecast Show:', type: :request do
  describe 'When I visit the api endpoint for /forecast with a city and state' do
    it 'I get a response with the current, hourly, and daily weather', :vcr do
      get '/api/v1/forecast?location=denver,co'

      response = JSON.parse(@response.body, symbolize_names: true)[:data][:attributes]

      expect(response[:currently]).to have_key(:time)
      expect(response[:currently]).to have_key(:summary)
      expect(response[:currently]).to have_key(:icon)
      expect(response[:currently]).to have_key(:temperature)
      expect(response[:currently]).to have_key(:apparent_temperature)
      expect(response[:currently]).to have_key(:humidity)
      expect(response[:currently]).to have_key(:visibility)
      expect(response[:currently]).to have_key(:uv_index)
    
      expect(response[:hourly].length).to eq(49)
      expect(response[:hourly].first).to have_key(:time)
      expect(response[:hourly].first).to have_key(:summary)
      expect(response[:hourly].first).to have_key(:icon)
      expect(response[:hourly].first).to have_key(:temperature)
    
      expect(response[:daily].length).to eq(8)
      expect(response[:daily].first).to have_key(:temperature_low)
      expect(response[:daily].first).to have_key(:temperature_high)
      expect(response[:daily].first).to have_key(:precip_probability)
      expect(response[:daily].first).to have_key(:precip_type)
    end
  end
end