//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Vikas Kumar on 11/01/24.
//

import Foundation

struct WeatherData {
    let locationName: String
    let temperature: Double
    let condition: String
}

struct WeatherResponse: Codable {
    let name: String
    let main: MainWeather
    let weather: [Weather]
}

struct MainWeather: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
}
