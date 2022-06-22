//
//  URLs.swift
//  Weather
//
//  Created by Никита on 6/16/22.
//

import Foundation

final class URLs {
    
    // MARK: URL for current forecast
    static let currentForecast: String = "http://api.weatherapi.com/v1/current.json"
    
    // MARK: URL for forecast for N days
    static let forecastForNDays: String = "http://api.weatherapi.com/v1/forecast.json"
}
