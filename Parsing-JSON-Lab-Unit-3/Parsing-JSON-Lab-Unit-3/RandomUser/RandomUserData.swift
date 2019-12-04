//
//  RandomUserData.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 12/4/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
   let results: [Results]
}

struct Results: Codable {
    let name: FullName
    let email: String
    let location: Address
    let phone: String
    let dob: BirthDate
}

struct FullName: Codable {
    let title: String
    let first: String
    let last: String
}

struct Address: Codable {
    let street: FullAddress
    let city: String
    let state: String
    let country: String
    let postcode: Int
}

struct FullAddress: Codable {
    let number: Int
    let name: String
}

struct BirthDate: Codable {
    let date: String
}


extension RandomUserData {
    
    func getRandomUsers() -> [Results]  {
        var randomUsers = [Results]()
        
        guard let fileURL = Bundle.main.url(forResource: "randomUser", withExtension: "json") else {
            fatalError("Unable to accese json data")
        }
            do {
                let data = try Data.init(contentsOf: fileURL)
                let userData = try JSONDecoder().decode(RandomUserData.self, from: data)
                randomUsers = userData.results
            } catch {
                fatalError("Unable load contents: \(error)")
    
        }
        
        
        
     return randomUsers
    }
}

