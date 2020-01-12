require 'rails_helper'

RSpec.describe GeocoderService do
  it 'Can get the lat and long coordinates of a given location', :vcr do
    location = 'denver,co'

    response = GeocoderService.get_geocoding(location)

    expect(response[:results][0][:geometry]).to have_key(:location)
    expect(response[:results][0][:geometry][:location]).to have_key(:lat)
    expect(response[:results][0][:geometry][:location]).to have_key(:lng)
  end
end
