//
//  Condition.swift
//  Weather
//
//  Created by Никита on 6/30/22.
//

import Foundation

// MARK: Struct for helping for receiving conditions with condition code from API
struct ConditionFromJSON {
    let day: String
    let night: String
    let icon: Int
}
