require 'rails_helper'

describe 'Background Show' do
  it 'Can get an image for the background', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    response = response = JSON.parse(@response.body, symbolize_names: true)[:data][:attributes]

    expect(response).to have_key(:url)
  end
end