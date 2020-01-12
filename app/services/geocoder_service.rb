class GeocoderService

  def self.get_geocoding(location)
    response = ApiQuerier.query_api(
      'https://maps.googleapis.com/maps/api',
      'geocode/json',
      create_params(location)
    )
  end

  private_class_method

  def self.create_params(location)
    {
      params: {
        'address' => location,
        'key' => ENV['GOOGLE_GEOCODE_API_KEY']
      }
    }
  end
end