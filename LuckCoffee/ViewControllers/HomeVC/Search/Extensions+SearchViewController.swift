//
//  Extensions+SearchViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 17.09.2024.
//

import UIKit

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredCoffee.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeCell.identifire, for: indexPath) as? CoffeeCell else {fatalError("In SearchViewController")}
        
        let coffeeModel = filteredCoffee[indexPath.row]
        cell.coffeeModel = coffeeModel
        cell.imageCoffeeCell.image = UIImage(named: coffeeModel.imageCoffee ?? "CoffeeImage")
        cell.nameCoffeeLabel.text = coffeeModel.nameCoffee
        cell.ingredientsCoffeeLabel.text = "\(coffeeModel.coffeeIngredients)"
        cell.priceCoffeeLabel.text = "\(coffeeModel.coffeePrice)$"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CoffeeInfoVC()
        let coffeeModel = filteredCoffee[indexPath.row]
        vc.detailModel = coffeeModel
        vc.coffeeInfo.imageCoffeeInfo.image = UIImage(named: coffeeModel.imageCoffee ?? "CoffeeImage")
        vc.coffeeInfo.namedCoffeeInfo.text = coffeeModel.nameCoffee
        vc.coffeeInfo.ingredientsCoffee.text = coffeeModel.coffeeIngredients
        vc.coffeeInfo.ratingButton.titleLabel?.text = String(coffeeModel.ratingCoffee)
        vc.coffeeInfo.discriptionLabel.text = coffeeModel.coffeeDiscriprions
        self.navigationController?.pushViewController(vc, animated: true)
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

extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text ?? "") + string
        
        filteredCoffee = data.filter({ coffee in
            return coffee.nameCoffee.lowercased().contains(searchText.lowercased()) ||
            coffee.coffeeIngredients.lowercased().contains(searchText.lowercased())
        })
        
        searchView.filteredCollectionView.reloadData()
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        filteredCoffee = data
        searchView.filteredCollectionView.reloadData()
        return true
    }
}
