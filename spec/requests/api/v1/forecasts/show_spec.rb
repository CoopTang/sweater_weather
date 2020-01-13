require 'rails_helper'

describe 'Forecast Show:', type: :request do
  describe 'When I visit the api endpoint for /forecast with a city and state' do
    it 'I get a response with the current, hourly, and daily weather', :vcr do
      get '/api/v1/forecast?location=denver,co'

      response = JSON.parse(@response.body, symbolize_names: true)[:data][:attributes]

      expect(response[:current_weather]).to have_key(:time)
      expect(response[:current_weather]).to have_key(:summary)
      expect(response[:current_weather]).to have_key(:icon)
      expect(response[:current_weather]).to have_key(:temperature)
      expect(response[:current_weather]).to have_key(:apparentTemperature)
      expect(response[:current_weather]).to have_key(:humidity)
      expect(response[:current_weather]).to have_key(:visibility)
      expect(response[:current_weather]).to have_key(:uvIndex)
    
      expect(response[:hourly_weather].length).to eq(49)
      expect(response[:hourly_weather].first).to have_key(:time)
      expect(response[:hourly_weather].first).to have_key(:summary)
      expect(response[:hourly_weather].first).to have_key(:icon)
      expect(response[:hourly_weather].first).to have_key(:temperature)
    
      expect(response[:daily_weather].length).to eq(8)
      expect(response[:daily_weather].first).to have_key(:temperatureLow)
      expect(response[:daily_weather].first).to have_key(:temperatureHigh)
      expect(response[:daily_weather].first).to have_key(:precipProbability)
      expect(response[:daily_weather].first).to have_key(:precipType)
    end
  end
end