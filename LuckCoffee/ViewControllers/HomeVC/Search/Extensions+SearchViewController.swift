//
//  Extensions+SearchViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 17.09.2024.
//

import UIKit

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeCell.identifire, for: indexPath) as? CoffeeCell else {fatalError("In SearchViewController")}
        
        let coffeeModel = data[indexPath.row]
        cell.coffeeModel = coffeeModel
        cell.imageCoffeeCell.image = UIImage(named: coffeeModel.imageCoffee ?? "CoffeeImage")
        cell.nameCoffeeLabel.text = coffeeModel.nameCoffee
        cell.ingredientsCoffeeLabel.text = "\(coffeeModel.coffeeIngredients)"
        cell.priceCoffeeLabel.text = "\(coffeeModel.coffeePrice)$"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 240)
    }
    //MARK: - Vertical
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    //MARK: - Horizontal
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
