class DirectionService
  GOOGLE_MAPS_API_URL = 'https://maps.googleapis.com'.freeze
  GOOGLE_MAPS_DIR_PATH = 'maps/api/directions/json'.freeze

  def self.get_directions(origin, destination)
    response = ApiQuerier.query_api(
      GOOGLE_MAPS_API_URL,
      GOOGLE_MAPS_DIR_PATH,
      create_params(origin, destination)
    )
  end

  private_class_method

  def self.create_params(origin, destination)
    {
      params: {
        'origin' => origin,
        'destination' => destination,
        'key' => ENV['GOOGLE_MAPS_API_KEY']
      }
    }
  end
end