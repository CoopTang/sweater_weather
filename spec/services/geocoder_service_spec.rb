require 'rails_helper'

RSpec.describe GeocoderService do
  it 'Can get the lat and long coordinates of a given location', :vcr do
    location = 'denver,co'

    response = GeocoderService.get_geocoding(location)

    expect(response[:results][0][:geometry]).to have_key(:location)
    expect(response[:results][0][:geometry][:location]).to have_key(:lat)
    expect(response[:results][0][:geometry][:location]).to have_key(:lng)
  end

  it 'can get the city(s) at a lat long location', :vcr do
    latlng = GeoCoordinate.new({ lat: -22.3193039, lng: -65.8306389 })

    response = GeocoderService.get_reverse_geocoding(latlng)

    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first).to have_key(:formatted_address)
  end
end
