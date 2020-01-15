require 'rails_helper'

RSpec.describe DarkSkyService do
  it 'Can get weather of a given latitude and longitude location', :vcr do
    location = GeoCoordinate.new({ lat: 39.7392358, lng: -104.990251 })

    response = DarkSkyService.get_current_weather(location)

    expect(response).to have_key(:currently)
    expect(response).to have_key(:minutely)
    expect(response[:minutely]).to have_key(:data)
    expect(response[:minutely][:data]).to be_an(Array)

    expect(response).to have_key(:hourly)
    expect(response[:hourly]).to have_key(:data)
    expect(response[:hourly][:data]).to be_an(Array)

    expect(response).to have_key(:daily)
    expect(response[:daily]).to have_key(:data)
    expect(response[:daily][:data]).to be_an(Array)
  end

  it 'Can get the forecast of a given latitude and longitude at a given time', :vcr do
    location = GeoCoordinate.new({ lat: 39.7392358, lng: -104.990251 })

    response = DarkSkyService.get_future_weather(location, 1579059119)

    expect(response).to have_key(:currently)
    expect(response[:currently][:time]).to eq(1579059119)
  end
end