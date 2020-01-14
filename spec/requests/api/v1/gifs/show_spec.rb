require 'rails_helper'

describe 'Gifs Show:' do
  describe 'When I make a get request to /api/v1/gifs?<location>' do
    it '; It returns a response with the following parameters' do
      get '/api/v1/gifs?location=denver,co'

      response = JSON.parse(@response.body)

      expect(response).to have_key(:data)
      expect(response).to have_key(:copyright)
      expect(response[:copyright]).to eq('2019')
      expect(response[:data]).to have_key(:images)
      expect(response[:data][:images]).to be_an(Array)
      expect(response[:data][:images][0]).to have_key(:time)
      expect(response[:data][:images][0]).to have_key(:url)
      expect(response[:data][:images][0]).to have_key(:summary)
    end
  end
end

# {
#   data: {
#     images: [
#       {
#         time: "1541487600",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541127600",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "2381487600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]     
#   },
#   copyright: "2019"
# }