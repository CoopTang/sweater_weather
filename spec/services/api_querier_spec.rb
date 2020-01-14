require 'rails_helper'

RSpec.describe 'ApiQuerier' do
  it 'can query an API', :vcr do
    params = {
      params: {
        'key' => ENV['GOOGLE_GEOCODE_API_KEY'],
        'address' => 'Denver, CO'
      }
    }
    response = ApiQuerier.query_api(
      'https://maps.googleapis.com/maps/api',
      'geocode/json',
      params
    )

    expect(response[:results][0][:geometry]).to have_key(:location)
    expect(response[:results][0][:geometry][:location]).to have_key(:lat)
    expect(response[:results][0][:geometry][:location]).to have_key(:lng)
  end

  it 'can query an API with headers', :vcr do
    location = GeoCoordinate.new({ lat: 22.3193039, lng: 114.1693611 })
    options = {
      params: {
        'lat' => location.latitude,
        'long' => location.longitude
      },
      headers: {
        'api_key' => ENV['AMYPODE_API_KEY']
      }
    }

    response = ApiQuerier.query_api(
      'http://amypode.herokuapp.com/api/v1',
      'antipodes',
      options
    )[:data][:attributes]

    expect(response).to have_key(:lat)
    expect(response[:lat]).to eq(-22.3193039)
    expect(response).to have_key(:long)
    expect(response[:long]).to eq(-65.8306389)
  end
end
