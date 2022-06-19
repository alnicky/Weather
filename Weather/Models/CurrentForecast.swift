//
//  CurrentForecast.swift
//  Weather
//
//  Created by Никита on 6/14/22.
//

import Foundation

struct CurrentForecast: Decodable {
    let location: Location
    let current: Current
}

struct Location: Decodable {
    let name: String
    let region: String
    let country: String
    let lat: Float
    let lon: Float
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

struct Current: Decodable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Float
    let tempF: Float
    let isDay: Int
    let condition: Condition
    let windMph: Float
    let windKph: Float
    let windDegree: Int
    let windDir: String
    let pressureMb: Float
    let pressureIn: Float
    let precipMm: Float
    let precipIn: Float
    let humidity: Int
    let cloud: Int
    let feelslikeC: Float
    let feelslikeF: Float
    let visKm: Float
    let visMiles: Float
    let uv: Float
    let gustMph: Float
    let gustKph: Float
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

struct Condition: Decodable {
    let text: String
    let icon: String
    let code: Int
}
