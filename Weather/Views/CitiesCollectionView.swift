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
        
        register(CitiesCollectionViewCell.self, forCellWithReuseIdentifier: CitiesCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CitiesCollectionView: UICollectionViewDelegate {
    
}

extension CitiesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CitiesCollectionViewCell.reuseId, for: indexPath) as! CitiesCollectionViewCell
        return cell
    }
    
    
}
