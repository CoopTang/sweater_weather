class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :timezone, :current_weather, :hourly_weather, :daily_weather
end
