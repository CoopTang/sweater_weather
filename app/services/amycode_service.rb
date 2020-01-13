class AmycodeService

  def self.get_antipode(location)
    response = ApiQuerier.query_api(
      'http://amypode.herokuapp.com/api/v1',
      'antipodes',
      create_options(location)
    )
  end

  private_class_method

  def self.create_options(location)
    {
      params: {
        'lat' => location.latitude,
        'long' => location.longitude
      },
      headers: {
        'api_key' => ENV['AMYPODE_API_KEY']
      }
    }
  end
end