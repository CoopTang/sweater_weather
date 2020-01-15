class ImageService
  IMAGE_URL = 'https://api.unsplash.com'.freeze
  SEARCH_PATH = 'search.photos'.freeze

  def self.get_image(term)
    ApiQuerier.query_api(
      IMAGE_URL,
      SEARCH_PATH,
      create_search_params(term)
    )
  end

  private_class_method

  def self.create_search_params(term)
    {
      params: {
        'query' => term,
        'client_id' => ENV['UNSPLASH_ACCESS_KEY']
      }
    }
  end
end