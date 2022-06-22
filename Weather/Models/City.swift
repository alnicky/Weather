//
//  City.swift
//  Weather
//
//  Created by Никита on 6/22/22.
//

import Foundation

// MARK: Model for search for adding new city
struct Cities: Decodable {
    let cities: [City?]
}

struct City: Decodable {
    let id: Int
    let name: String
    let region: String
    let country: String
    let lat: Float
    let lon: Float
    let url: String
}
