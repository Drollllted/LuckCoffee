//
//  CoffeeRequest.swift
//  LuckCoffee
//
//  Created by Drolllted on 21.04.2024.
//

import UIKit

struct CoffeeModel: Identifiable{
    let id: UUID
    let nameCoffee: String
    let imageCoffee: String?
    let coffeeIngredients: String
    let coffeeDiscriprions: String
    let coffeePrice: Double
    let ratingCoffee: Double
    var isLiked: Bool
    
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
}
