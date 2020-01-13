class GeocoderService

  GOOGLE_API_URL = 'https://maps.googleapis.com/maps/api'.freeze
  GOOGLE_GEOCODE_PATH = 'geocode/json'.freeze

  def self.get_geocoding(location)
    response = ApiQuerier.query_api(
      GOOGLE_API_URL,
      GOOGLE_GEOCODE_PATH,
      create_params('address', location)
    )
  end

  def self.get_reverse_geocoding(location)
    response = ApiQuerier.query_api(
      GOOGLE_API_URL,
      GOOGLE_GEOCODE_PATH,
      create_params('latlng', "#{location.latitude},#{location.longitude}")
    )
  end

  private_class_method

  def self.create_params(key, location)
    {
      params: {
        key => location,
        'key' => ENV['GOOGLE_GEOCODE_API_KEY']
      }
    }
  end
end