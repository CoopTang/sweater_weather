class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(origin_param, destination_param)
    @id               = 1
    @origin           = Location.new(origin_param)
    @destination      = Location.new(destination_param)
    @travel_time      = ""
    @arrival_forecast = nil
    get_road_trip_info(origin_param, destination_param)
  end

  private

  def get_road_trip_info(origin, destination)
    trip = DirectionService.get_directions(origin, destination)
    travel_time_unix = current_time + get_travel_time(trip)
    dest_coordinate = get_destination_coordinate(trip)

    forecast = DarkSkyService.get_future_weather(dest_coordinate, travel_time_unix)
    @arrival_forecast = Currently.new(forecast[:currently])
  end

  def get_travel_time(trip)
    @travel_time = trip[:routes][0][:legs][0][:duration][:text]
    trip[:routes][0][:legs][0][:duration][:value]
  end

  def get_destination_coordinate(trip)
    GeoCoordinate.new(trip[:routes][0][:legs][0][:end_location])
  end

  def current_time
    Time.now.to_i
  end
  
end