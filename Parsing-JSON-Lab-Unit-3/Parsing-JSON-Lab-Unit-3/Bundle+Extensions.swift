//
//  Bundle+Extensions.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 12/3/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation
extension Bundle {
    static func readRawJSONData(filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("resource with filename \(filename) not found")
        }
        var data: Data!
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not found: \(error)")
        }
        return data
    }
}

