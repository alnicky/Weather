//
//  MainVC+Extenions.swift
//  Weather
//
//  Created by Никита on 6/22/22.
//

import Foundation
import UIKit

// MARK: UISearchResultsUpdating for searh controller

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
}

extension MainViewController {
    
    // MARK: Creating and configuring gradiend latyer
    func configureGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemCyan.cgColor
        ]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    @objc func addTapped() {
        print("add")
    }
    
    @objc func editTapped() {
        print("edit")
    }
}

