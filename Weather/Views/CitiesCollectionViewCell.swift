//
//  CitiesCollectionViewCell.swift
//  Weather
//
//  Created by Никита on 6/18/22.
//

import UIKit

class CitiesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CitiesCollectionViewCell"
    
    var cityLabel: UILabel!
    var temperatureLabel: UILabel!
    var conditionImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureBlurBackground()
        
        configureCityLabel()
        configureConditionImage()
        configureTemperatureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCityLabel() {
        cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.textColor = .white
        cityLabel.textAlignment = .left
        cityLabel.font = .boldSystemFont(ofSize: 25)
        cityLabel.numberOfLines = 0
        
        addSubview(cityLabel)
        
        // Constraints
        cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func configureConditionImage() {
        conditionImage = UIImageView()
        conditionImage.translatesAutoresizingMaskIntoConstraints = false
//        conditionImage.image = UIImage(named: "113")
        conditionImage.contentMode = .scaleAspectFit
        conditionImage.clipsToBounds = true
        
        addSubview(conditionImage)
        
        // Constraints
        conditionImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        conditionImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: SizeConstants.conditionImageTopDistanseToCityLabel).isActive = true
        conditionImage.widthAnchor.constraint(equalToConstant: 64).isActive = true
        conditionImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    private func configureTemperatureLabel() {
        temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = .boldSystemFont(ofSize: 50)
        temperatureLabel.adjustsFontSizeToFitWidth = true
        
        addSubview(temperatureLabel)
        
        // Constraints
        temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: conditionImage.leadingAnchor, constant: -10).isActive = true
        temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func configureBlurBackground() {
        backgroundColor = .clear
        
        let blurEffect =  UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = bounds
        blurEffectView.translatesAutoresizingMaskIntoConstraints = true
        blurEffectView.clipsToBounds = true
        blurEffectView.layer.cornerRadius = 10
        
        insertSubview(blurEffectView, at: 0)

        // Constraints
        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurEffectView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        blurEffectView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}
