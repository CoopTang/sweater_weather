class ForecastFacade
  attr_reader :currently,
              :hourly,
              :daily,
              :id,
              :timezone

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
    parse_forecast(DarkSkyService.get_current_weather(coordinate))
  end

  private

  def get_geocode_coordinate(location)
    response = GeocoderService.get_geocoding(location)
    has_results?(response) ? parse_geo_code(response) : default_geo_code
  end

  def parse_forecast(forecast)
    @timezone = forecast[:timezone]
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

  def has_results?(response)
    !response[:results].empty?
  end

  def parse_geo_code(response)
    GeoCoordinate.new(response[:results][0][:geometry][:location])
  end

  def default_geo_code
    GeoCoordinate.new({ lat: 39.7392358, lng: -104.990251 })
  end
end