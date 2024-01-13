//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Vikas Kumar on 12/01/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    // Open Weather API
    
    func getWeather(lat: CLLocationDegrees, long: CLLocationDegrees) async throws -> ResponseBody {
        let API_KEY = "6c03b453ab2bc720ec9dfd3084e55674"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&units=metric&appid=\(API_KEY)"
        
        guard let url = URL(string: urlString) else { fatalError("Something went wrong...") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(ResponseBody.self, from: data)
        return decodedData
    }
}
