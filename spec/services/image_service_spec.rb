require 'rails_helper'

RSpec.describe ImageService do
  it 'Can get an image back based on a query', :vcr do
    location = 'denver'

    response = ImageService.get_image(location)

    expect(response[:photos][:results][0][:urls]).to have_key(:full)
  end
end
