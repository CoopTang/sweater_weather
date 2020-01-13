class AntipodeFacade
  attr_reader :antipodes

  def initialize(location)
    @location = location
    @antipodes = []
    get_antipodes(@location)
  end

  private

  def get_antipodes(location)
    geocoding           = GeocodeService.get_geocoding(location)
    start_geocoordinate = GeoCoordinate.new(geocoding[:results][0][:geometry])

    antipode               = Amypode.get_antipode(start_geocoordinate)
    antipode_geocoordinate = GeoCoordinate.new(antipode[:results][:attributes])

    locations_d = GeocodeService.get_reverse_geocoding(antipode_geocoordinate)
    i = 1
    locations_d[:results].each do |location_d|
      geocoordinate = GeoCoordinate.new(location_d[:geometry][:location])
      weather_response = DarkSkyService.get_weather(geocoordinate)
      weather = weather_response[:currently].slice(:summary, :temperature)
      @antipodes.push(Antipode.new(antipode_params(id, location_d, weather)))
    end
  end

  private 

  def antipode_params(id, location, weather)
    {
      id: id,
      location_name: location_d[:formatted_address],
      forecast: weather,
      search_location: @location
    }
  end
end