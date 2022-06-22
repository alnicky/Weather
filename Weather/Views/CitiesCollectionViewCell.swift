//
//  CitiesCollectionViewCell.swift
//  Weather
//
//  Created by Никита on 6/18/22.
//

import UIKit

class CitiesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CitiesCollectionViewCell"
    
    var conditionImage: UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(conditionImage)
        
        conditionImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        conditionImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        conditionImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        conditionImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
