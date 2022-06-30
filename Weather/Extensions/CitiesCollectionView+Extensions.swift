//
//  CitiesCollectionView+Extensions.swift
//  Weather
//
//  Created by Никита on 6/23/22.
//

import Foundation
import UIKit

// MARK: UICollectionView Delegate Flow Layout
extension CitiesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SizeConstants.cityIconSide, height: SizeConstants.cityIconSide)
    }
}

// MARK: UICollectionView Data Source
extension CitiesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CitiesCollectionViewCell.reuseId, for: indexPath) as! CitiesCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.cityLabel.text = data[indexPath.row].location.name
        cell.temperatureLabel.text = "\(data[indexPath.row].current.tempC)º"
        
        guard let imageNumber = NetworkManager.shared.getCondition(for: data[indexPath.row].current.condition.code)?.icon else { return cell}
        cell.conditionImage.image = UIImage(named: "\(imageNumber)")
        
        return cell
    }
}

extension CitiesCollectionView: UICollectionViewDelegate {
    
}

// MARK: Constatns for adjusting different sizes of CityCollectionView
struct SizeConstants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let citiesMinimumLineSpacing: CGFloat = 15
    static let citiesMinimumInteritemSpacing: CGFloat = 15
    static let cityIconSide: CGFloat = (UIScreen.main.bounds.width - SizeConstants.leftDistanceToView - SizeConstants.rightDistanceToView - SizeConstants.citiesMinimumLineSpacing) / 2
    static let conditionImageTopDistanseToCityLabel = ((cityIconSide - 70) / 2) - 32
}
