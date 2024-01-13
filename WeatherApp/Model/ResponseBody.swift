//
//  ResponseBody.swift
//  WeatherApp
//
//  Created by Vikas Kumar on 13/01/24.
//

import Foundation

struct ResponseBody: Decodable {
    let coord: CoordinateResponse
    let weather: [WeatherResponse]
    let main: MainResponse
    let name: String
    let wind: WindResponse
    
    struct CoordinateResponse: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct WeatherResponse: Decodable {
        let id: Double
        let main: String
        let description: String
        let icon: String
    }
    
    struct MainResponse: Decodable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct WindResponse: Decodable {
        let speed: Double
        let deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { feels_like }
    var tempMin: Double { temp_min }
    var tempMax: Double { temp_max }
}
