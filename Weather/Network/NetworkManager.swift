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
    
    func getCurrentForecast(for city: String) {
        let parameters: [String: String] = ["key": apiKey,
                                            "q": city,
                                            "aqi": "no"]
        
        AF.request(URLs.currentForecast, parameters: parameters)
          .validate()
          .responseDecodable(of: CurrentForecast.self) { (response) in
              switch response.result {
              case .success(let value):
                  print()
              case .failure(let error):
                  print("Failed with error: \(error)")
              }
          }
    }
}
