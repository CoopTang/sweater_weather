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

    expect(response[:results][0][:geometry]).to have_key(:viewport)
    expect(response[:results][0][:geometry][:viewport]).to have_key(:northeast)
    expect(response[:results][0][:geometry][:viewport]).to have_key(:southwest)
  end
end
