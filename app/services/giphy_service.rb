class GiphyService
  GIPHY_API_URL = 'https://api.giphy.com/v1'.freeze
  GIPHY_GIF_SEARCH_API = 'gifs/search'

  def self.search_gifs(term)
    response = ApiQuerier.query_api(
      GIPHY_API_URL,
      GIPHY_GIF_SEARCH_API,
      create_params(term)
    )
  end

  private_class_method

  def self.create_params(term)
    {
      params: {
        'q' => term,
        'key' => ENV['GIPHY_API_KEY']
      }
    }
  end
end