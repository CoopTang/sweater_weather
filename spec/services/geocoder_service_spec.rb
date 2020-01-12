require 'rails_helper'

RSpec.describe GeocoderService do
  it 'Can get the lat and long coordinates of a given location', :vcr do
    location = 'Denver, CO'
    expected_coordinate = {
      lat: 39.7392358,
      lng: -104.990251
    }

    coordinate = GeocoderService.get_lat_long(location)

    expect(coordinate.latitude).to eq(args[:lat])
    expect(coordinate.longitude).to eq(args[:lng])
  end
end
