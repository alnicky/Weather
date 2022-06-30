//
//  CitiesCollectionView.swift
//  Weather
//
//  Created by Никита on 6/18/22.
//

import UIKit

class CitiesCollectionView: UICollectionView {
    
    // MARK: Data with current forecasts
    var data: [CurrentForecast] = []
    
    // MARK: Cities for forecasts
    var cities: [String] = []

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = .clear
//        configureGradientBackground()
        
        register(CitiesCollectionViewCell.self, forCellWithReuseIdentifier: CitiesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = SizeConstants.citiesMinimumLineSpacing
        contentInset =  UIEdgeInsets(top: 0,
                                     left: SizeConstants.leftDistanceToView,
                                     bottom: 0,
                                     right: SizeConstants.rightDistanceToView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

