class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location_name, :forecast
  attribute :search_location
end
