//
//  CoffeeRequest.swift
//  LuckCoffee
//
//  Created by Drolllted on 21.04.2024.
//

import UIKit

struct CoffeeModel: Identifiable, Codable{
    let id: UUID
    let nameCoffee: String
    let imageCoffee: String?
    let coffeeIngredients: String
    let coffeeDiscriprions: String
    let coffeePrice: Double
    let ratingCoffee: Double
    var isLiked: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isLiked\(ratingCoffee)")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isLiked\(ratingCoffee)")
        }
    }
    
    init(id: UUID = UUID(), nameCoffee: String, imageCoffee: String?, coffeeIngredients: String, coffeeDiscriprions: String, coffeePrice: Double, ratingCoffee: Double, isLiked: Bool) {
        self.id = id
        self.nameCoffee = nameCoffee
        self.imageCoffee = imageCoffee
        self.coffeeIngredients = coffeeIngredients
        self.coffeeDiscriprions = coffeeDiscriprions
        self.coffeePrice = coffeePrice
        self.ratingCoffee = ratingCoffee
        self.isLiked = isLiked
    }
    
    static func saveItLiked(coffeeName: String, isLiked: Bool) {
        UserDefaults.standard.set(isLiked, forKey: "isLiked\(coffeeName)")
    }
    
    static func getItLiked(coffeeName: String) -> Bool? {
        UserDefaults.standard.bool(forKey: "isLiked\(coffeeName)")
    }
}
