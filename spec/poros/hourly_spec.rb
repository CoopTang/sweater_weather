require 'rails_helper'

describe Hourly do
  it 'has attributes' do

    params = {
      time: 1579018577,
      summary: "Partly Cloudy",
      icon: "partly-cloudy-day",
      temperature: 63.83
    }
    hourly = Hourly.new(params)

    expect(hourly.time).to eq(params[:time])
    expect(hourly.summary).to eq(params[:summary])
    expect(hourly.icon).to eq(params[:icon])
    expect(hourly.temperature).to eq(params[:temperature])
  end
end