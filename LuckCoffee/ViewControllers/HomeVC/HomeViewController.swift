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
    
    //MARK: - LifeCycles
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
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
        cell.setupImage()
        return cell
    }
    
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 135, height: 200)
    }
}
