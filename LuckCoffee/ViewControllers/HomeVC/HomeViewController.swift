//
//  ViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
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
        
        homeView.buttonTextField.addTarget(self, action: #selector(goToSearchVC), for: .touchUpInside)
    }
    
    @objc private func goToSearchVC(){
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
        vc.coffeeInfo.ratingLabel.text = String(coffeeModel.ratingCoffee)
        vc.coffeeInfo.discriptionLabel.text = coffeeModel.coffeeDiscriprions
        vc.clouserIsSelected = { model in
            data[indexPath.item] = model
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        
        // Вычисляем ширину одной ячейки с учетом отступов
        let cellWidth = (width - 14) / 2 // 14 = 7 + 7 (отступы между ячейками)
        
        // Сохраняем пропорцию высоты к ширине (240/170)
        let aspectRatio: CGFloat = 240 / 170
     //   let cellHeight = cellWidth * aspectRatio
        
        return CGSize(width: 170, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 20, bottom: 7, right: 20)
    }
}
