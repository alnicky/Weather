//
//  MainViewController.swift
//  Weather
//
//  Created by Никита on 6/14/22.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class MainViewController: UIViewController {
    
    // MARK: Main collection view with cities and forecasts
    private var citiesCollectionView = CitiesCollectionView()
    
    var currentForecasts: [CurrentForecast] = []
    var cities: [String] = ["Moscow", "London"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(citiesCollectionView )
        citiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        citiesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        citiesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        citiesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        fetchCurrentForecast() { [weak self] forecasts in
            self?.currentForecasts = forecasts
            print(self?.currentForecasts)
        }
    }
    
    func fetchCurrentForecast(completionHandler: @escaping ([CurrentForecast]) -> ()) {
        var forecasts: [CurrentForecast] = []
        
        for city in cities {
            let parameters: [String: String] = ["key": apiKey,
                                                "q": city,
                                                "aqi": "no"]
            
            AF.request(URLs.currentForecast, parameters: parameters)
                .validate()
                .responseDecodable(of: CurrentForecast.self) { [weak self] response in
                    switch response.result {
                    case .success(let value):
                        forecasts.append(value)
                    case .failure(let error):
                        print("ERROR: \(error)")
                    }
                    if forecasts.count == self?.cities.count {
                        completionHandler(forecasts)
                    }
                }
        }
    }
    
}

