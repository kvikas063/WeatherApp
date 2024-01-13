//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vikas Kumar on 11/01/24.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var weather: ResponseBody?
    var weatherManager = WeatherManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    ProgressView()
                        .task {
                            do {
                                weather = try await weatherManager.getWeather(lat: location.latitude, long: location.longitude)
                            }
                            catch {
                                debugPrint("Something went wrong!")
                            }
                        }
                }
            } else {
                Welcome()
                    .environmentObject(locationManager)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color("light"), Color("dark")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
