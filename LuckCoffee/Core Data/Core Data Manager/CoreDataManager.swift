//
//  CoreDataManager.swift
//  LuckCoffee
//
//  Created by Drolllted on 09.09.2024.
//

import CoreData
import UIKit

enum CoreDataErrors {
    case notFound
}

final class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    static var coffee = [Coffee]()
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    private override init(){
        super.init()
    }
    
    //MARK: - Add
    
    func addToFavorites(coffee: CoffeeModel) {
        let newCoffee = Coffee(context: context)
        newCoffee.nameCoffee = coffee.nameCoffee
        newCoffee.coffeePrice = coffee.coffeePrice
        newCoffee.coffeeIngredients = coffee.coffeeIngredients
        newCoffee.coffeeDiscription = coffee.coffeeDiscriprions
        newCoffee.ratingCoffee = coffee.ratingCoffee
        newCoffee.imageCoffee = coffee.imageCoffee
        newCoffee.isLiked = false
        
        do{
            try! context.save()
            print("Database successful")
        }
    }
    
    //MARK: - Fetch
    
    func fetchFavoritexCoffee() -> [Coffee] {
        do{
            let request = Coffee.fetchRequest() as NSFetchRequest<Coffee>
            CoreDataManager.coffee = try! context.fetch(request)
            return CoreDataManager.coffee
        }
    }
    
    //MARK: - Update Like Status
    
    func updateLikeStatus(for coffee: Coffee, isLiked: Bool) -> Bool {
        coffee.isLiked = isLiked
        do{
            try! context.save()
            return true
        }
    }
    
    //MARK: - Delete Coffee
    
    func deleteCoffees(coffeeName: String) {
        let fetchRequest = Coffee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "nameCoffee = %@", coffeeName)
        
        do{
            let coffes = try context.fetch(fetchRequest)
            if let exitingCoffee = coffes.first {
                context.delete(exitingCoffee)
                try context.save()
                print("Coffee is Deleted")
            }
        }catch{
            
        }
    }
    
    
}
