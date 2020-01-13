class Forecast
  attr_reader :timezone,
              :current_weather,
              :hourly_weather,
              :daily_weather,
              :id

  def initialize(location)
    @id = 0
    @timezone = ""
    @current_weather = {}
    @hourly_weather = []
    @daily_weather = []
    get_forecast(location)
  end

  def get_forecast(location)
    geo_coder = GeocoderService.get_geocoding(location)[:results][0][:geometry]
    coordinate = GeoCoordinate.new(geo_coder[:location])
    forecast_response = DarkSkyService.get_weather(coordinate)
    parse_forecast(forecast_response)
  end

  private

  def parse_forecast(forecast)
    @timezone = forecast[:timezone]
    @current_weather = parse_currently(forecast[:currently])
    forecast[:hourly][:data].each do |hour|
      @hourly_weather.push(parse_hourly(hour))
    end
    forecast[:daily][:data].each do |day|
      @daily_weather.push(parse_daily(day))
    end
  end

  def parse_currently(currently)
    currently.slice(
      :time,
      :summary,
      :icon,
      :temperature,
      :apparentTemperature,
      :humidity,
      :visibility,
      :uvIndex
    )
  end

  def parse_hourly(hourly)
    hourly.slice(
      :time,
      :summary,
      :icon,
      :temperature
    )
  end

  def parse_daily(daily)
    daily.slice(
      :temperatureLow,
      :temperatureHigh,
      :precipProbability,
      :precipType
    )
  end
end