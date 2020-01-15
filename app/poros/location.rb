class Location
  attr_reader :city,
              :state

  def initialize(location)
    split_location = location.split(',')
    @city = split_location.first.capitalize
    @state = split_location.last.upcase
  end
end