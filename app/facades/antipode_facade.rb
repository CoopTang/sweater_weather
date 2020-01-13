class AntipodeFacade
  attr_reader :antipodes

  def initialize(location)
    @location = location
    @antipodes = []
    get_antipodes(@location)
  end

  private

  def get_antipodes(location)
    geocoding           = GeocoderService.get_geocoding(location)[:results][0]
    start_geocoordinate = GeoCoordinate.new(geocoding[:geometry][:location])

    antipode               = AmypodeService.get_antipode(start_geocoordinate)
    coord = {
      lat: antipode[:data][:attributes][:lat],
      lng: antipode[:data][:attributes][:long] 
    }
    antipode_geocoordinate = GeoCoordinate.new(coord)


    binding.pry
    locations_d = GeocoderService.get_reverse_geocoding(antipode_geocoordinate)
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