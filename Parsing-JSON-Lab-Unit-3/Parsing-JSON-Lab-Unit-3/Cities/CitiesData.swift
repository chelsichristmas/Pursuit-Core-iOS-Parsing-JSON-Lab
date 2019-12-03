//
//  CitiesData.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 11/27/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct AllWeatherConditions: Codable {
    let list: [CitiesData]
}

struct CitiesData: Codable {
    let name: String
    let main: Temperature
    let weather: [Weather]
}

struct Temperature: Codable {
    let temp: Double
}


struct Weather: Codable {
    let description: String
}

extension AllWeatherConditions {
    
    static func getWeatherConditions() -> [CitiesData] {
        
    var weather = [CitiesData]()
        
        guard let fileURL = Bundle.main.url(forResource: "citiesWithinRectZone", withExtension: "json") else {
            fatalError("Could not locate json file")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            let weatherData = try JSONDecoder().decode(AllWeatherConditions.self, from: data)
            weather = weatherData.list
        } catch {
            fatalError("Failed to load contents \(error)")
        }
        
        return weather
    }
}
