class ForecastFacade
  attr_reader :timezone,
              :currently,
              :hourly,
              :daily,
              :id

  def initialize(location)
    @id        = 1
    @timezone  = ""
    @currently = {}
    @hourly    = []
    @daily     = []
    get_forecast(location)
  end

  def get_forecast(location)
    coordinate = get_geocode_coordinate(location)
    parse_forecast(DarkSkyService.get_weather(coordinate))
  end

  private

  def get_geocode_coordinate(location)
    geo_code = GeocoderService.get_geocoding(location)[:results][0][:geometry]
    GeoCoordinate.new(geo_code[:location])
  end

  def parse_forecast(forecast)
    @timezone = forecast[:timezone]
    @currently = Currently.new(forecast[:currently])
    forecast[:hourly][:data].each do |hour|
      @hourly.push(parse_hourly(hour))
    end
    forecast[:daily][:data].each do |day|
      @daily.push(parse_daily(day))
    end
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