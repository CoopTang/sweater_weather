class GeoCoordinate
  attr_reader :latitude,
              :longitude

  def initialize(args)
    @latitude  = args[:lat]
    @longitude = args[:lng]
  end
end