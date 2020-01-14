require 'rails_helper'

describe Daily do
  it 'has attributes' do
    params = {
      time: 1578974400,
      summary: "Possible light rain overnight.",
      icon: "rain",
      sunriseTime: 1578995580,
      sunsetTime: 1579043640,
      moonPhase: 0.66,
      precipIntensity: 0.0084,
      precipIntensityMax: 0.0544,
      precipIntensityMaxTime: 1579060800,
      precipProbability: 0.59,
      precipType: 'rain',
      temperatureHigh: 68.44,
      temperatureHighTime: 1579027620,
      temperatureLow: 46.47,
      temperatureLowTime: 1579078440,
      apparentTemperatureHigh: 67.94,
      apparentTemperatureHighTime: 1579027620,
      apparentTemperatureLow: 45.41,
      apparentTemperatureLowTime: 1579078440,
      dewPoint: 41.03,
      humidity: 0.61,
      pressure: 1010,
      windSpeed: 7.25,
      windGust: 17.86,
      windGustTime: 1579037340,
      windBearing: 17,
      cloudCover: 0.81,
      uvIndex: 13,
      uvIndexTime: 1579020780,
      visibility: 9.809,
      ozone: 246.8,
      temperatureMin: 47.5,
      temperatureMinTime: 1578989100,
      temperatureMax: 68.44,
      temperatureMaxTime: 1579027620,
      apparentTemperatureMin: 46.74,
      apparentTemperatureMinTime: 1578988620,
      apparentTemperatureMax: 67.94,
      apparentTemperatureMaxTime: 1579027620
    }
    daily = Daily.new(params)

    expect(daily.temperature_low).to eq(params[:temperatureLow])
    expect(daily.temperature_high).to eq(params[:temperatureHigh])
    expect(daily.precip_probability).to eq(params[:precipProbability])
    expect(daily.precip_type).to eq(params[:precipType])
  end
end