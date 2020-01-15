class DarkSkyService
  DARK_SKY_URL = 'https://api.darksky.net'.freeze

  def self.get_current_weather(location)
    response = ApiQuerier.query_api(
      DARK_SKY_URL,
      create_current_forecast_endpoint(location)
    )
  end

  def self.get_future_weather(location, time)
    response = ApiQuerier.query_api(
      DARK_SKY_URL,
      create_future_forecast_endpoint(location, time)
    )
  end

  private_class_method

  def self.create_current_forecast_endpoint(location)
    lat  = location.latitude
    long = location.longitude
    "forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}"
  end

  def self.create_future_forecast_endpoint(location, time)
    lat  = location.latitude
    long = location.longitude
    "forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long},#{time}"
  end
end