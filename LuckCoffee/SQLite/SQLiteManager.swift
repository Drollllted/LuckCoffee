//
//  SQLiteManager.swift
//  LuckCoffee
//
//  Created by Drolllted on 30.09.2024.
//

import Foundation
import SQLite

class SQLiteManager {
    static let shared = SQLiteManager()
    
    private init(){}
    
    func addCoffee(coffee: CoffeeModel) -> Bool {
        do{
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
            ).first!
            _ = copyDatabaseIfNeeded(sourcePath: Bundle.main.path(forResource: "CoffeeOrder", ofType: "db")!)
            let db = try Connection("\(path)/db.CoffeeOrder")
            
            let table = Table("Coffee")
            
            let id = Expression<Int64>(value: "id")
            let nameCoffee = Expression<String>(value: "nameCoffee")
            let ingredientsCoffee = Expression<String>(value: "ingredientCoffee")
            let discriptionsCoffee = Expression<String>(value: "DiscriptionCoffee")
            let coffeePrice = Expression<Float>(value: "coffeePrice")
            let ratingCoffee = Expression<Float>(value: "ratingCoffee")
            let countCoffee = Expression<Int64>(value: "countCoffee")
            
            try db.run(table.create{ t in
                t.column(id, primaryKey: true)
                t.column(nameCoffee)
                t.column(ingredientsCoffee)
                t.column(discriptionsCoffee)
                t.column(coffeePrice)
                t.column(ratingCoffee)
                t.column(countCoffee)
            })
            
           // let insert = table.insert(id <- 1)

            
            print("Кофе успешно добавлено в SQLite")
            
            return true
        }catch {
            print("Не получилось добавить данные в базу данных: \(error.localizedDescription)")
            return false
        }
        
    }
    
    
    func copyDatabaseIfNeeded(sourcePath: String) -> Bool {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destinationPath = documents + "/db.CoffeeOrder"
        let exists = FileManager.default.fileExists(atPath: destinationPath)
        guard !exists else { return false }
        do {
            try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
            return true
        } catch {
          print("error during file copy: \(error)")
            return false
        }
    }
}
