class Gif
  attr_reader :time,
              :summary,
              :url

  def initialize(args)
    @time = args[:time]
    @summary = args[:summary]
    @url = args[:url]
  end
end