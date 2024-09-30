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
    var coffee = [Coffee]()
    
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
        newCoffee.isLiked = true
        
        do{
            try context.save()
            print("Database successful")
        } catch {
            print("Troubles in addToFavorites Function - \(error.localizedDescription)")
        }
    }
    
    //MARK: - Fetch
    
    func fetchFavoritexCoffee() -> [Coffee] {
        do{
            let request = Coffee.fetchRequest() as NSFetchRequest<Coffee>
            coffee = try context.fetch(request)
            return coffee
        }catch{
            print("Troubles in fetchFavoritexCoffee Function - \(error.localizedDescription)")
        }
        return []
    }

    //MARK: - Update Like Status
    
    func updateLikeStatus(for coffee: Coffee, isLiked: Bool) -> Bool? {
        coffee.isLiked = isLiked
        do{
            try context.save()
            return true
        }catch{
            print("Troubles in UpdateLikeStatus Function - \(error.localizedDescription)")
        }
        return nil
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
            print("Troubles in deleteCoffees Function - \(error.localizedDescription)")
        }
    }
}
