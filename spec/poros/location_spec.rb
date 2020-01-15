require 'rails_helper'

describe Location do
  it 'Has attributes' do
    location = 'denver,co'

    location = Location.new(location)

    expect(location).to be_a(Location)
    expect(location.city).to eq('Denver')
    expect(location.state).to eq('CO')
  end
end
