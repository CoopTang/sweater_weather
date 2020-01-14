class GifFacade 
  attr_reader :id, :images, :copyright

  def initialize(location)
    @id = 1
    @images = []
    @copyright = "2019"
    get_images(location)
  end

  private

  def get_images(location)
    coordinate = get_geocode_coordinate(location)
    parse_forecast(DarkSkyService.get_weather(coordinate))
  end

  def get_geocode_coordinate(location)
    geo_code = GeocoderService.get_geocoding(location)[:results][0][:geometry]
    GeoCoordinate.new(geo_code[:location])
  end

  def parse_forecast(forecast)
    create_images(forecast[:hourly])
  end

  def create_images(hourly_forecast)
    hourly_forecast[:data].each do |hour_data|
      summary = hour_data[:summary]
      time    = hour_data[:time]
      gif_url = GiphyService.search_gifs(summary)[:data].sample[:url]
      images.push(Gif.new({ time: time, summary: summary, url: gif_url }))
    end
  end
end