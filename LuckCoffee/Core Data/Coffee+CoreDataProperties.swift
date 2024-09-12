//
//  Coffee+CoreDataProperties.swift
//  LuckCoffee
//
//  Created by Drolllted on 09.09.2024.
//
//

import Foundation
import CoreData

@objc(Coffee)
public class Coffee: NSManagedObject {

}

extension Coffee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coffee> {
        return NSFetchRequest<Coffee>(entityName: "Coffee")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var nameCoffee: String?
    @NSManaged public var imageCoffee: String?
    @NSManaged public var coffeeIngredients: String?
    @NSManaged public var coffeeDiscription: String?
    @NSManaged public var coffeePrice: Double
    @NSManaged public var ratingCoffee: Double
    @NSManaged public var isLiked: Bool

    convenience init(nameCoffee: String,
                         imageCoffee: String?,
                         coffeeIngredients: String,
                         coffeeDiscriprions: String,
                         coffeePrice: Double,
                         ratingCoffee: Double) {
            self.init(entity: Coffee.entity(), insertInto: nil)
            self.nameCoffee = nameCoffee
            self.imageCoffee = imageCoffee
            self.coffeeIngredients = coffeeIngredients
            self.coffeeDiscription = coffeeDiscription
            self.coffeePrice = coffeePrice
            self.ratingCoffee = ratingCoffee
        }
}

extension Coffee : Identifiable {

}
