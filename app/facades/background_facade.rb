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
    response = ImageService.get_image(location)
    has_photos?(response) ? update_url(response) : default_url
  end
  
  def has_photos?(response)
    !response[:photos][:results].empty?
  end
  
  def update_url(response)
    @url = response[:photos][:results][0][:urls][:full]
  end

  def default_url
    @url = 'https://images.unsplash.com/photo-1494870363241-b5225be3dada?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjExMDg5MX0'
  end
end