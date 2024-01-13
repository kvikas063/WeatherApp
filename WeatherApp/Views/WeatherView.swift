//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Vikas Kumar on 13/01/24.
//

import SwiftUI

//https://openweathermap.org/img/wn/10d@2x.png

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(weather.name)
                .font(.system(size: 36, weight: .semibold))
            
            Text("\(Date().formatted(.dateTime.month().day()))")
                .font(.system(size: 20))
                .opacity(0.5)
            
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60)
                
                VStack(alignment: .leading) {
                    Text(weather.main.feelsLike.roundedDouble())
                        .font(.system(size: 50, weight: .semibold))
                    
                    Text(weather.weather[0].main)
                        .font(.system(size: 18))
                }
                .padding(.leading)
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            CardView(icon: "thermometer", text: "Min temp", value: weather.main.tempMin.roundedDouble() + "*")
            CardView(icon: "thermometer", text: "Max temp", value: weather.main.tempMax.roundedDouble() + "*")
            CardView(icon: "wind", text: "Wind Speed", value: weather.wind.speed.roundedDouble() + "m/s")
            CardView(icon: "humidity", text: "Humidity", value: weather.main.humidity.roundedDouble() + "%")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color("light"), Color("dark")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

extension Double {
    
    func roundedDouble() -> String {
        return String(format: "%.0f", self)
    }
}
