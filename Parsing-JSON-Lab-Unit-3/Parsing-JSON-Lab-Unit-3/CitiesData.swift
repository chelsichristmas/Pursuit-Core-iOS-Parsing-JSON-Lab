//
//  CitiesData.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 11/27/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct CitiesData: Codable {
    let allCityConditions: [WeatherConditions]
}

struct WeatherConditions: Codable {
    let temp: Double
    let weather: String
    
}

extension CitiesData {
    static func getWeatherConditions() -> [WeatherConditions] {
    var weather = [WeatherConditions]()
        guard let fileURL = Bundle.main.url(forResource: "customname", withExtension: "json") else {
            fatalError("Could not locate json file")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            let weatherData = try JSONDecoder().decode(CitiesData.self, from: data)
            weather = weatherData.allCityConditions
        } catch {
            fatalError("Failed to load contents \(error)")
        }
        
        return weather
    }
}
