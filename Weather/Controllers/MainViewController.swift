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
    }
    
}

