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
end
