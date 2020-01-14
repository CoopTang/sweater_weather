class Hourly
  attr_reader :time,
              :summary,
              :icon,
              :temperature

  def initialize(args)
    @time                 = args[:time]
    @summary              = args[:summary]
    @icon                 = args[:icon]
    @temperature          = args[:temperature]
  end 
end