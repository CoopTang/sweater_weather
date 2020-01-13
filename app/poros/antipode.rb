class Antipode
  attr_reader :id,
              :location_name,
              :forecast,
              :search_location

  def initialize(args)
    binding.pry
    @id = args[:id]
    @location_name = args[:location_name]
    @forecast = args[:forecast]
    @search_location = args[:search_location]
  end