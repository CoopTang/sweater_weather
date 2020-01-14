require 'rails_helper'

RSpec.describe GiphyService do
  it 'Can get weather of a given latitude and longitude location', :vcr do
    term = 'Mostly Cloudy'

    response = GiphyService.search_gifs(term)

    expect(response).to have_key(:data)
    expect(response[:data][0][:url]).to eq("https://giphy.com/gifs/sky-clouds-cloud-HoUgegTjteXCw")
  end
end