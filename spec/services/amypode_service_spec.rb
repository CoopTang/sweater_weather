require 'rails_helper'

RSpec.describe AmycodeService do
  it 'Can get weather of a given latitude and longitude location', :vcr do
    location = GeoCoordinate.new({ lat: 22.3193039, lng: 114.1693611 })

    response = AmycodeService.get_antipode(location)[:data][:attributes]

    expect(response).to have_key(:lat)
    expect(response[:lat]).to eq(-22.3193039)
    expect(response).to have_key(:long)
    expect(response[:long]).to eq(-65.8306389)
  end
end