class Daily
  attr_reader :temperature_low,
              :temperature_high,
              :precip_probability,
              :precip_type

  def initialize(args)
    @temperature_low    = args[:temperatureLow]
    @temperature_high   = args[:temperatureHigh]
    @precip_probability = args[:precipProbability]
    @precip_type        = args[:precipType]
  end
end