//
//  MainViewController.swift
//  Weather
//
//  Created by Никита on 6/14/22.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    // MARK: Search controller
    let searchController = UISearchController()
    
    // MARK: Main collection view with cities and forecasts
    private var citiesCollectionView = CitiesCollectionView()
    
    var currentForecasts: [CurrentForecast] = []
    var cities: [String] = ["Moscow", "London", "Saint Petersburg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding and configuring gradient layer as background
        configureGradientBackground()
        
        // Configuring title
        title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Configuring add button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        // Configuring settings button
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        view.addSubview(citiesCollectionView)
        
        citiesCollectionView.cities = cities
        
        // Constraints
        citiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        citiesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        citiesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        citiesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Get forecasts
        NetworkManager.shared.fetchCurrentForecasts(for: cities) { [weak self] forecasts in
            self?.citiesCollectionView.data = forecasts
            self?.citiesCollectionView.reloadData()
        }
    }
}

