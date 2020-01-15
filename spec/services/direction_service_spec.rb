require 'rails_helper'

RSpec.describe 'DirectionService' do
  it 'Can get get the nearest electric stations for Turing', :vcr do
    turing = '1331 17th St LL100, Denver, CO 80202'
    station = 'Seventeenth Street Plaza'

    response = DirectionService.get_directions(turing, station)
    response = response[:routes].first[:legs].first

    expect(response[:distance][:text]).to eq('0.1 mi')
    expect(response[:duration][:text]).to eq('1 min')
    expect(response[:steps].first[:html_instructions]).to eq("Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")
  end
end
