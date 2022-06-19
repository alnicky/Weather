//
//  DaysForecast.swift
//  Weather
//
//  Created by Никита on 6/14/22.
//

import Foundation

// MARK: Forecast for N days
struct DaysForecast: Decodable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Forecast: Decodable {
    let forecastday: [Forecastday]
}

struct Forecastday: Decodable {
    let date: String
    let dateEpoch: Int
    let day: DailyForecast
    let astro: AstroForecast
    let hour: HourForecast
    
    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case date
        case day
        case astro
        case hour
    }
}

struct DailyForecast: Decodable {
    let maxtempC: Float
    let maxtempF: Float
    let mintempC: Float
    let mintempF: Float
    let avgtempC: Float
    let avgtempF: Float
    let maxwindMph: Float
    let maxwindKph: Float
    let totalprecipMm: Float
    let totalprecipIn: Float
    let avgvisKm: Float
    let avgvisMiles: Float
    let avghumidity: Int
    let dailyWillItRain: Int
    let dailyChanceOfRain: Int
    let dailyWillItSnow: Int
    let dailyChanceOfSnow: Int
    let condition: Condition
    let uv: Float
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case avgvisKm = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv
    }
}

struct AstroForecast: Decodable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moonPhase: String
    let moonIllumination: Float
    
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

struct HourForecast: Decodable {
    let timeEpoch: Int
    let time: String
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
    let windchillC: Float
    let windchillF: Float
    let heatindexC: Float
    let heatindexF: Float
    let dewpointC: Float
    let dewpointF: Float
    let willItRain: Int
    let chanceOfRain: Int
    let willItSnow: Int
    let chanceOfSnow: Int
    let visKm: Float
    let visMiles: Float
    let gustMph: Float
    let gustKph: Float
    let uv: Float
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "windDegree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}
