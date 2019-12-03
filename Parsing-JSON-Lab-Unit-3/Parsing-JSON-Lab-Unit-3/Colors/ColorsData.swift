//
//  ColorsData.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 12/3/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct ColorsData: Decodable {
    var colors: [Details]
}

struct Details: Decodable {
    var hex: [Hex]
    var rgb: [RGB]
}

struct Hex: Decodable {
    var value: String
}

struct RGB: Decodable {
    var rValue: Int
    var gValue: Int
    var bValue: Int
    
    private enum CodingKeys: String, CodingKey {
        case rValue = "r"
        case gValue = "g"
        case bValue = "b"
    }
}

extension ColorsData {
    static func getColors() -> [Details] {
        var colors = [Details]()
        guard let fileURL = Bundle.main.url(forResource: "colorScheme", withExtension: "json") else {
            fatalError("Unable to locate colorSchemes.json")
        }
            do {
                let data = try Data.init(contentsOf: fileURL)
                let colorData = try JSONDecoder().decode(ColorsData.self, from: data)
                colors = colorData.colors
                
            } catch {
                fatalError("Failed to load contents: \(error)")
        }
        return colors
    }
}
