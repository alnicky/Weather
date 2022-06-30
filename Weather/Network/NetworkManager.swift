//
//  NetworkManager.swift
//  Weather
//
//  Created by Никита on 6/16/22.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static var shared = NetworkManager()
    
    // MARK: Fetching current forecasts for cities in array
    func fetchCurrentForecasts(for cities: [String], completionHandler: @escaping ([CurrentForecast]) -> ()) {
        var forecasts: [CurrentForecast] = []
        
        for city in cities {
            let parameters: [String: String] = ["key": apiKey,
                                                "q": city,
                                                "aqi": "no"]
            
            AF.request(URLs.currentForecast, parameters: parameters)
                .validate()
                .responseDecodable(of: CurrentForecast.self) { response in
                    switch response.result {
                    case .success(let value):
                        forecasts.append(value)
                    case .failure(let error):
                        print("ERROR: \(error)")
                    }
                    if forecasts.count == cities.count {
                        completionHandler(forecasts)
                    }
                }
        }
    }
    
    // MARK: Fetching forecats for N days for current city
    func fetchForecastForNDays(for city: String, completionHandler: @escaping (CurrentForecast) -> ()) {
//        var forecast: DaysForecast
        
        
    }
    
    // MARK: Receiving conditions with condition code from API
    func getCondition(for code: Int) -> ConditionFromJSON? {
        switch code {
        case 1000:
            let condition = ConditionFromJSON(day: "Sunny", night: "Clear", icon: 113)
            return condition
        case 1003:
            let condition = ConditionFromJSON(day: "Partly cloudy", night: "Partly cloudy", icon: 116)
            return condition
        case 1006:
            let condition = ConditionFromJSON(day: "Cloudy", night: "Cloudy", icon: 119)
            return condition
        case 1009:
            let condition = ConditionFromJSON(day: "Overcast", night: "Overcast", icon: 122)
            return condition
        case 1030:
            let condition = ConditionFromJSON(day: "Mist", night: "Mist", icon: 143)
            return condition
        case 1063:
            let condition = ConditionFromJSON(day: "Patchy rain possible", night: "Patchy rain possible", icon: 176)
            return condition
        case 1066:
            let condition = ConditionFromJSON(day: "Patchy snow possible", night: "Patchy snow possible", icon: 179)
            return condition
        case 1069:
            let condition = ConditionFromJSON(day: "Patchy sleet possible", night: "Patchy sleet possible", icon: 182)
            return condition
        case 1072:
            let condition = ConditionFromJSON(day: "Patchy freezing drizzle possible", night: "Patchy freezing drizzle possible", icon: 185)
            return condition
        case 1087:
            let condition = ConditionFromJSON(day: "Thundery outbreaks possible", night: "Thundery outbreaks possible", icon: 200)
            return condition
        case 1114:
            let condition = ConditionFromJSON(day: "Blowing snow", night: "Blowing snow", icon: 227)
            return condition
        case 1117:
            let condition = ConditionFromJSON(day: "Blizzard", night: "Blizzard", icon: 230)
            return condition
        case 1135:
            let condition = ConditionFromJSON(day: "Fog", night: "Fog", icon: 248)
            return condition
        case 1147:
            let condition = ConditionFromJSON(day: "Freezing fog", night: "Freezing fog", icon: 260)
            return condition
        case 1150:
            let condition = ConditionFromJSON(day: "Patchy light drizzle", night: "Patchy light drizzle", icon: 263)
            return condition
        case 1153:
            let condition = ConditionFromJSON(day: "Light drizzle", night: "Light drizzle", icon: 266)
            return condition
        case 1168:
            let condition = ConditionFromJSON(day: "Freezing drizzle", night: "Freezing drizzle", icon: 281)
            return condition
        case 1171:
            let condition = ConditionFromJSON(day: "Heavy freezing drizzle", night: "Heavy freezing drizzle", icon: 284)
            return condition
        case 1180:
            let condition = ConditionFromJSON(day: "Patchy light rain", night: "Patchy light rain", icon: 293)
            return condition
        case 1183:
            let condition = ConditionFromJSON(day: "Light rain", night: "Light rain", icon: 296)
            return condition
        case 1186:
            let condition = ConditionFromJSON(day: "Moderate rain at times", night: "Moderate rain at times", icon: 299)
            return condition
        case 1189:
            let condition = ConditionFromJSON(day: "Moderate rain", night: "Moderate rain", icon: 302)
            return condition
        case 1192:
            let condition = ConditionFromJSON(day: "Heavy rain at times", night: "Heavy rain at times", icon: 305)
            return condition
        case 1195:
            let condition = ConditionFromJSON(day: "Heavy rain", night: "Heavy rain", icon: 308)
            return condition
        case 1198:
            let condition = ConditionFromJSON(day: "Light freezing rain", night: "Light freezing rain", icon: 311)
            return condition
        case 1201:
            let condition = ConditionFromJSON(day: "Moderate or heavy freezing rain", night: "Moderate or heavy freezing rain", icon: 314)
            return condition
        case 1204:
            let condition = ConditionFromJSON(day: "Light sleet", night: "Light sleet", icon: 317)
            return condition
        case 1207:
            let condition = ConditionFromJSON(day: "Moderate or heavy sleet", night: "Moderate or heavy sleet", icon: 320)
            return condition
        case 1210:
            let condition = ConditionFromJSON(day: "Patchy light snow", night: "Patchy light snow", icon: 323)
            return condition
        case 1213:
            let condition = ConditionFromJSON(day: "Light snow", night: "Light snow", icon: 326)
            return condition
        case 1216:
            let condition = ConditionFromJSON(day: "Patchy moderate snow", night: "Patchy moderate snow", icon: 329)
            return condition
        case 1219:
            let condition = ConditionFromJSON(day: "Moderate snow", night: "Moderate snow", icon: 332)
            return condition
        case 1222:
            let condition = ConditionFromJSON(day: "Patchy heavy snow", night: "Patchy heavy snow", icon: 335)
            return condition
        case 1225:
            let condition = ConditionFromJSON(day: "Heavy snow", night: "Heavy snow", icon: 338)
            return condition
        case 1237:
            let condition = ConditionFromJSON(day: "Ice pellets", night: "Ice pellets", icon: 350)
            return condition
        case 1240:
            let condition = ConditionFromJSON(day: "Light rain shower", night: "Light rain shower", icon: 353)
            return condition
        case 1243:
            let condition = ConditionFromJSON(day: "Moderate or heavy rain shower", night: "Moderate or heavy rain shower", icon: 356)
            return condition
        case 1246:
            let condition = ConditionFromJSON(day: "Torrential rain shower", night: "Torrential rain shower", icon: 359)
            return condition
        case 1249:
            let condition = ConditionFromJSON(day: "Light sleet showers", night: "Light sleet showers", icon: 362)
            return condition
        case 1252:
            let condition = ConditionFromJSON(day: "Moderate or heavy sleet showers", night: "Moderate or heavy sleet showers", icon: 365)
            return condition
        case 1255:
            let condition = ConditionFromJSON(day: "Light snow showers", night: "Light snow showers", icon: 368)
            return condition
        case 1258:
            let condition = ConditionFromJSON(day: "Moderate or heavy snow showers", night: "Moderate or heavy snow showers", icon: 371)
            return condition
        case 1261:
            let condition = ConditionFromJSON(day: "Light showers of ice pellets", night: "Light showers of ice pellets", icon: 374)
            return condition
        case 1264:
            let condition = ConditionFromJSON(day: "Moderate or heavy showers of ice pellets", night: "Moderate or heavy showers of ice pellets", icon: 377)
            return condition
        case 1273:
            let condition = ConditionFromJSON(day: "Patchy light rain with thunder", night: "Patchy light rain with thunder", icon: 386)
            return condition
        case 1276:
            let condition = ConditionFromJSON(day: "Moderate or heavy rain with thunder", night: "Moderate or heavy rain with thunder", icon: 389)
            return condition
        case 1279:
            let condition = ConditionFromJSON(day: "Patchy light snow with thunder", night: "Patchy light snow with thunder", icon: 392)
            return condition
        case 1282:
            let condition = ConditionFromJSON(day: "Moderate or heavy snow with thunder", night: "Moderate or heavy snow with thunder", icon: 395)
            return condition
        default:
            return nil
        }
    }
}
