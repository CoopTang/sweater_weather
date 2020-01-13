require 'rails_helper'

describe GeoCoordinate do
  it 'creates an object with attributes' do
    args = {
      lat: 39.7392358,
      lng: -104.990251
    }

    coordinate = GeoCoordinate.new(args)

    expect(coordinate.latitude).to eq(args[:lat])
    expect(coordinate.longitude).to eq(args[:lng])
  end
end