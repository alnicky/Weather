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
}
