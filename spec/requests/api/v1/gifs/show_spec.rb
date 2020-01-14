require 'rails_helper'

describe 'Gifs Show:' do
  describe 'When I make a get request to /api/v1/gifs?<location>' do
    it '; It returns a response with the following parameters', :vcr do
      get '/api/v1/gifs?location=denver,co'

      response = JSON.parse(@response.body, symbolize_names: true)

      expect(response).to have_key(:data)
      expect(response[:data][:attributes]).to have_key(:copyright)
      expect(response[:data][:attributes][:copyright]).to eq('2019')
      expect(response[:data][:attributes]).to have_key(:images)
      expect(response[:data][:attributes][:images]).to be_an(Array)
      expect(response[:data][:attributes][:images][0]).to have_key(:time)
      expect(response[:data][:attributes][:images][0]).to have_key(:url)
      expect(response[:data][:attributes][:images][0]).to have_key(:summary)
    end
  end
end
