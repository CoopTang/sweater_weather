class ForecastFacade
  attr_reader :currently,
              :hourly,
              :daily,
              :id

  def initialize(location)
    @id        = 1
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
    create_currently(forecast[:currently])
    create_hourly(forecast[:hourly])
    create_daily(forecast[:daily])
  end
  
  def create_currently(currently_forecast)
    @currently = Currently.new(currently_forecast)
  end
  
  def create_hourly(hourly_forecast)
    hourly_forecast[:data].each do |hour_data|
      @hourly.push(Hourly.new(hour_data))
    end
  end
  
  def create_daily(daily_forecast)
    daily_forecast[:data].each do |day_data|
      @daily.push(Daily.new(day_data))
    end
  end
end