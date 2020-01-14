class Currently
  attr_reader :time,
              :summary,
              :icon,
              :temperature,
              :apparent_temperature,
              :humidity,
              :visibility,
              :uv_index

  def initialize(args)
    @time                 = args[:time]
    @summary              = args[:summary]
    @icon                 = args[:icon]
    @temperature          = args[:temperature]
    @apparent_temperature = args[:apparentTemperature]
    @humidity             = args[:humidity]
    @visibility           = args[:visibility]
    @uv_index             = args[:uvIndex]
  end 
end