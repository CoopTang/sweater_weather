require 'rails_helper'

describe Currently do
  it 'has attributes' do

    params = {
      time: 1579018577,
      summary: "Partly Cloudy",
      icon: "partly-cloudy-day",
      temperature: 63.83,
      apparentTemperature: 63.83,
      humidity: 0.39,
      visibility: 10,
      uvIndex: 13
    }
    currently = Currently.new(params)

    expect(currently.time).to eq(params[:time])
    expect(currently.summary).to eq(params[:summary])
    expect(currently.icon).to eq(params[:icon])
    expect(currently.temperature).to eq(params[:temperature])
    expect(currently.apparent_temperature).to eq(params[:apparentTemperature])
    expect(currently.humidity).to eq(params[:humidity])
    expect(currently.visibility).to eq(params[:visibility])
    expect(currently.uv_index).to eq(params[:uvIndex])
  end
end