class DarkSkyService
  DARK_SKY_URL = 'https://api.darksky.net'.freeze

  def self.get_weather(location)
    response = ApiQuerier.query_api(
      DARK_SKY_URL,
      create_forecast_endpoint(location)
    )
  end

  private_class_method

  def self.create_forecast_endpoint(location)
    lat  = location.latitude
    long = location.longitude
    "forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}"
  end
end