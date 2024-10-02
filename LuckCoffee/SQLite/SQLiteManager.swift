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
    
    //MARK: - Properties SQLite
    
    let id = Expression<Int64>(value: "id")
    let nameCoffee = Expression<String>(value: "nameCoffee")
    let ingredientsCoffee = Expression<String>(value: "ingredientCoffee")
    let discriptionsCoffee = Expression<String>(value: "DiscriptionCoffee")
    let coffeePrice = Expression<Float>(value: "coffeePrice")
    let ratingCoffee = Expression<Float>(value: "ratingCoffee")
    let countCoffee = Expression<Int64>(value: "countCoffee")
    
    private init(){}
    
    //MARK: - Create Table
    
    func createTableSQL(for db: Connection) throws {
        do{
            
            //MARK: - Create table Rows
            
            let table = Table("Coffee")
            
            let id = Expression<Int64?>(value: "id")
            let nameCoffee = Expression<String>(value: "nameCoffee")
            let ingredientsCoffee = Expression<String>(value: "ingredientCoffee")
            let discriptionsCoffee = Expression<String>(value: "DiscriptionCoffee")
            let coffeePrice = Expression<Float?>(value: "coffeePrice")
            let ratingCoffee = Expression<Float?>(value: "ratingCoffee")
            let countCoffee = Expression<Int64?>(value: "countCoffee")
            
            //MARK: - Create Table
            
            try db.run(table.create{ t in
                t.column(id, primaryKey: true)
                t.column(nameCoffee)
                t.column(ingredientsCoffee)
                t.column(discriptionsCoffee)
                t.column(coffeePrice)
                t.column(ratingCoffee)
                t.column(countCoffee)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Insert Coffee
    
    func addCoffee(coffee: CoffeeModel){
        do{
            let db = try Connection(fileName())
            
            let table = Table("Coffee")
            
            //MARK: - Insert CoffeeModel
            
            try db.run(table.insert(
                nameCoffee <- coffee.nameCoffee,
                ingredientsCoffee <- coffee.coffeeIngredients,
                discriptionsCoffee <- coffee.coffeeDiscriprions,
                coffeePrice <- String(coffee.coffeePrice),
                ratingCoffee <- String(coffee.ratingCoffee),
                countCoffee <- "1"
            ))
            
            print("Кофе успешно добавлено в SQLite")
        }catch {
            print("Не получилось добавить данные в базу данных: \(error.localizedDescription)")
            print(error)
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
    
    //MARK: FileName
    
    func fileName() -> String{
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        
        let name = "\(path)/db.CoffeeOrder"
        return name
    }
    
    //MARK: func initialize
    
    func initTables() {
        do{
            let db = try Connection(fileName())
            
            try createTableSQL(for: db)
        } catch {
            print("Error initialized = \(error.localizedDescription)")
        }
    }
}
