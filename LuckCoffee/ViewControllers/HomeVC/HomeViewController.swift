//
//  ViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    private var homeView: HomeView!
    var coffeeModel: CoffeeModel!
    
    //MARK: - LifeCycles
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colors
        self.navigationController?.navigationBar.tintColor = .clear
        
        homeView.coffeeCollectionView.delegate = self
        homeView.coffeeCollectionView.dataSource = self
    }
}


//MARK: - Horizontal Slide Menu
    
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CoffeeCell.identifire, for: indexPath) as? CoffeeCell else {fatalError("What's wrong?")}
        let coffeeModel = data[indexPath.row]
        cell.coffeeModel = coffeeModel
        cell.imageCoffeeCell.image = UIImage(named: coffeeModel.imageCoffee ?? "CoffeeImage")
        cell.nameCoffeeLabel.text = coffeeModel.nameCoffee
        cell.ingredientsCoffeeLabel.text = "\(coffeeModel.coffeeIngredients)"
        cell.priceCoffeeLabel.text = "\(coffeeModel.coffeePrice)$"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CoffeeInfoVC()
        let coffeeModel = data[indexPath.row]
        vc.detailModel = coffeeModel
        vc.coffeeInfo.imageCoffeeInfo.image = UIImage(named: coffeeModel.imageCoffee ?? "CoffeeImage")
        vc.coffeeInfo.namedCoffeeInfo.text = coffeeModel.nameCoffee
        vc.coffeeInfo.ingredientsCoffee.text = coffeeModel.coffeeIngredients
        vc.coffeeInfo.ratingButton.titleLabel?.text = String(coffeeModel.ratingCoffee)
        vc.coffeeInfo.discriptionLabel.text = coffeeModel.coffeeDiscriprions
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 240)
    }
    //Vertical
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    //Horizontal
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
}
