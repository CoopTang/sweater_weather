class BackgroundFacade
  attr_reader :id,
              :url

  def initialize(location)
    @id  = 1
    @url = ''
    get_url(location)
  end

  private

  def get_url(location)
    image = ImageService.get_image(location)
    @url = image[:photos][:results][0][:urls][:full]
  end
end